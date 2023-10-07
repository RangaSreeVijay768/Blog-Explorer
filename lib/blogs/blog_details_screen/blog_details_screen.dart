
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/widgets/base_stateless_widget.dart';
import '../../themes/app_colors.dart';
import '../../themes/edge_insets.dart';
import '../../themes/fonts.dart';
import '../../themes/borders.dart';
import '../blog_full_detail_view/blog_full_detail_view.dart';
import '../blog_home_screen/blog_home_screen_controller.dart';
import '../blog_home_screen/blog_home_screen_cubit.dart';


class BlogDetailsScreen extends BaseStatelessWidget<BlogHomeScreenController, BlogHomeScreenCubit> {
  final String id;
  final String title;
  final String image;
  const BlogDetailsScreen({super.key, required this.id, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlogHomeScreenCubit>(
        create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BlogHomeScreenCubit, BlogHomeScreenState>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
              body: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            border: GradientBoxBorder(
                                width: 2,
                                gradient: LinearGradient(colors: [
                                  AppColors.primary,
                                  AppColors.yellow,
                                  AppColors.textRed
                                ])
                            )
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 190,
                              decoration: BoxDecoration(
                                  color: AppColors.bgLightBlue,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(image)
                                  )
                              ),
                            ),
                            Container(
                              padding: edge_insets_x_16,
                              height: 80,
                              color: AppColors.bgPrimary,
                              alignment: Alignment.center,
                              child: Text(title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: Fonts.fontSize22,
                                    fontWeight: Fonts.f500
                                ),),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: BlogFullDetailsView(
                          id: id,
                          title: title,
                          image: image
                      ),),


                      Row(
                        children: [
                          const SizedBox(width: 20,),
                          Expanded(
                              child: Container(
                                margin: edge_insets_y_4,
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: AppColors.bgPrimary,
                                        shape: RoundedRectangleBorder(borderRadius: borderRadius.br_30),
                                        padding: edge_insets_y_13
                                    ),
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BlogFullDetailsView(
                                          id: id,
                                          title: title,
                                          image: image
                                      )));
                                    },
                                    child: Text("View details in full screen", style: TextStyle(
                                        fontSize: Fonts.fontSize18,
                                        color: AppColors.white
                                    ),)
                                ),
                              )
                          ),
                          SizedBox(width: 20,)
                        ],
                      )

                    ],
                  ),
                  Container(
                    margin: edge_insets_l_20,
                    padding: edge_insets_t_48,
                    child: InkWell(
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.grey2,
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: AppColors.textHeading,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              )
          );
        },
      ),
    );
  }

  @override
  BlogHomeScreenCubit createCubitAndAssignToController(BuildContext context) {
    BlogHomeScreenCubit blogHomeScreenCubit =
        BlogHomeScreenCubit();
    controller?.cubit = blogHomeScreenCubit;
    return blogHomeScreenCubit;
  }
}





