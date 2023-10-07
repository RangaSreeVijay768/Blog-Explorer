import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen.dart';
import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen_internet_error/blog_home_screen_internet_error_cubit.dart';
import 'package:blog_explorer/core/widgets/base_stateless_widget.dart';
import 'package:blog_explorer/themes/app_colors.dart';
import 'package:blog_explorer/themes/edge_insets.dart';
import 'package:blog_explorer/themes/fonts.dart';
import 'package:blog_explorer/themes/borders.dart';
import 'package:blog_explorer/themes/shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen_internet_error/blog_home_screen_internet_error_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogHomeScreenInternetError extends BaseStatelessWidget<BlogHomeScreenInternetErrorController, BlogHomeScreenInternetErrorCubit>{
  const BlogHomeScreenInternetError({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlogHomeScreenInternetErrorCubit>(
        create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BlogHomeScreenInternetErrorCubit, BlogHomeScreenInternetErrorState>(
        listener: (context, state){},
        builder: (context, state){
          return Center(
              child: Container(
                height: 380,
                margin: edge_insets_x_30,
                padding: edge_insets_16,
                decoration: BoxDecoration(
                    boxShadow: const [shadows.bs_primary],
                    color: AppColors.white,
                    borderRadius: borderRadius.br_10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: borderRadius.br_10,
                      child: Image.asset('images/no internet.gif',
                        fit: BoxFit.fitHeight,
                        height: 180,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('No internet', style: TextStyle(
                        fontSize: Fonts.fontSize20,
                        fontWeight: Fonts.f700
                    ),),
                    const Text(
                      "Please check internet connection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Fonts.fontSize18
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: edge_insets_x_30,
                            side: const BorderSide(
                                color: AppColors.bgPrimary,
                                width: 2
                            ),
                            shape: RoundedRectangleBorder(borderRadius: borderRadius.br_5)
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BlogHomeScreen()));
                        },
                        child: const Text('Retry',style: TextStyle(
                            fontSize: Fonts.fontSize18
                        ),)
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  @override
  BlogHomeScreenInternetErrorCubit createCubitAndAssignToController(BuildContext context) {
    BlogHomeScreenInternetErrorCubit blogHomeScreenInternetErrorCubit =
        BlogHomeScreenInternetErrorCubit();
    controller?.cubit = blogHomeScreenInternetErrorCubit;
    return blogHomeScreenInternetErrorCubit;
  }

}