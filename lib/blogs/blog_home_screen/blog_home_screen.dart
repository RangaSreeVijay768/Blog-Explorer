import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../core/widgets/base_stateless_widget.dart';
import '../../themes/app_colors.dart';
import '../../themes/borders.dart';
import '../../themes/fonts.dart';
import '../../themes/shadows.dart';
import '../../themes/edge_insets.dart';
import '../blog_details_screen/blog_details_screen.dart';
import '../blogs_model/blogs_model.dart';
import '../favourites/favourites_cubit.dart';
import 'blog_home_screen_controller.dart';
import 'blog_home_screen_cubit.dart';

void main() {
  final cubit = BlogHomeScreenCubit();
  cubit.fetchData();
  runApp(BlogHomeScreen());
}


class BlogHomeScreen extends BaseStatelessWidget<BlogHomeScreenController, BlogHomeScreenCubit> {
  const BlogHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BlogHomeScreenCubit()..fetchData()),
          BlocProvider(create: (context) => FavouritesCubit()),
        ],
        child:
            BlocConsumer<BlogHomeScreenCubit, BlogHomeScreenState<List<Blogs>>>(
              listener: (context, state){},
          builder: (context, state) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: AppBar(
                  backgroundColor: AppColors.bgPrimary,
                  automaticallyImplyLeading: false,
                  title: Center(child: Text("Blog Explorer", style: TextStyle(
                    color: AppColors.white,
                    fontSize: Fonts.fontSize32,
                    fontWeight: Fonts.f500
                  ),),),
                  // titleSpacing: 100,
                ),
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/welcome_bg.jpg'),
                        fit: BoxFit.fill)),
                child: Center(
                  child: state.when(
                      initial: () => Center(
                          child: Container(
                            width: 230,
                            padding: edge_insets_y_24,
                            decoration: BoxDecoration(
                                boxShadow: const [shadows.bs_primary],
                                color: AppColors.white,
                                borderRadius: borderRadius.br_10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LoadingAnimationWidget.discreteCircle(
                                    color: AppColors.bgPrimary,
                                    size: 50,
                                    secondRingColor: AppColors.bmiTracker,
                                    thirdRingColor:
                                    AppColors.waterPrimary),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                    "Please wait\nwhile loading....")
                              ],
                            ),
                          )),
                      // loading: () => CircularProgressIndicator(),
                      data: (blogs) => ListView.builder(
                        itemCount: blogs.length,
                        itemBuilder: (context, index) {
                          return Builder(builder: (context) {
                            final blog = blogs[index];
                            final isFavorite = context.select(
                                    (FavouritesCubit cubit) => cubit.state
                                    .any((favorite) =>
                                favorite.id == favorite.id));
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BlogDetailsScreen(
                                                id: blog.id,
                                                title: blog.title,
                                                image: blog.image_url)));
                              },
                              child: Container(
                                // padding: edge_insets_10,
                                margin: edge_insets_16,
                                decoration: BoxDecoration(
                                    borderRadius: borderRadius.br_20,
                                    border: borders.b_5px_rainbow,
                                    boxShadow: const [shadows.bs_primary]),
                                child: BlurryContainer(
                                  padding: edge_insets_20,
                                  blur: 30,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        // alignment: Alignment.center,
                                        height: 300,
                                        // margin: edge_insets_16,
                                        decoration: BoxDecoration(
                                            color:
                                            AppColors.bgLightBlue,
                                            borderRadius:
                                            borderRadius.br_20,
                                            border:
                                            const GradientBoxBorder(
                                                width: 5,
                                                gradient:
                                                LinearGradient(
                                                    colors: [
                                                      // AppColors.rainbow1,
                                                      // AppColors.rainbow2,
                                                      AppColors.rainbow4,
                                                      AppColors.rainbow6,
                                                      // AppColors.rainbow4,
                                                      AppColors.rainbow6,
                                                      AppColors.rainbow4
                                                    ])),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    blog.image_url))),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          margin: edge_insets_8,
                                          child: Text(
                                            blog.title,
                                            style: const TextStyle(
                                                fontSize: Fonts.fontSize18,
                                                fontWeight: Fonts.f500,
                                                color: AppColors.white),
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Text(post.id,style: const TextStyle(color: AppColors.grey4),),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                    backgroundColor: blog.favourite? AppColors.bgLightBlue: AppColors.white,
                                                    padding: edge_insets_y_16,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        borderRadius
                                                            .br_30)),
                                                onPressed: () {
                                                  if (context.mounted) {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(content: Text(
                                                          blog.favourite ? 'Removed from favourites'
                                                                          : 'Successfully added to favourites',
                                                        // style: TextStyle(color: AppColors.white),
                                                      )),
                                                    );
                                                  }
                                                  final favoritesCubit = context.read<FavouritesCubit>();
                                                  getCubit(context).toggleLike(blog.id);
                                                  if (isFavorite) {
                                                    favoritesCubit.removeFavorite(blog);
                                                  } else {
                                                    favoritesCubit.addFavorite(blog);
                                                  }
                                                },
                                                child: Icon(
                                                  blog.favourite ? Icons.favorite : Icons.favorite_border,
                                                  color: blog.favourite? AppColors.textRed: AppColors.bgPrimary,
                                                ),
                                              )
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Expanded(
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    AppColors.white,
                                                    padding:
                                                    edge_insets_y_16,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        borderRadius
                                                            .br_30)),
                                                onPressed: () {
                                                  // Navigator.of(context).push(
                                                  //     MaterialPageRoute(builder: (context) => BlogDetailsScreen(
                                                  //         id: post.id,
                                                  //         title: post.title,
                                                  //         image: post.image_url
                                                  //     )));
                                                },
                                                child: const Icon(
                                                    Icons.share),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            );
                          });
                        },
                      )),
                ),
              ),
            );
          },
        ));
  }

  @override
  BlogHomeScreenCubit createCubitAndAssignToController(BuildContext context) {
    BlogHomeScreenCubit blogHomeScreenCubit = BlogHomeScreenCubit();
    controller?.cubit = blogHomeScreenCubit;
    return blogHomeScreenCubit;
  }
}
