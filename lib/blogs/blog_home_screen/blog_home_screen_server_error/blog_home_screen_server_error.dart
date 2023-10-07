import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen.dart';
import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen_server_error/blog_home_screen_server_error.dart';
import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen_server_error/blog_home_screen_server_error_controller.dart';
import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen_server_error/blog_home_screen_server_error_cubit.dart';
import 'package:blog_explorer/core/widgets/base_stateless_widget.dart';
import 'package:blog_explorer/themes/app_colors.dart';
import 'package:blog_explorer/themes/edge_insets.dart';
import 'package:blog_explorer/themes/borders.dart';
import 'package:blog_explorer/themes/fonts.dart';
import 'package:blog_explorer/themes/shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogHomeScreenServerError extends BaseStatelessWidget<BlogHomeScreenServerErrorController, BlogHomeScreenServerErrorCubit> {
  const BlogHomeScreenServerError({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlogHomeScreenServerErrorCubit>(
        create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BlogHomeScreenServerErrorCubit, BlogHomeScreenServerErrorState>(
        listener: (context, state){},
        builder: (context, state){
          return Center(
              child: Container(
                height: 420,
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
                      child: Image.asset('images/api-failed.png',
                        fit: BoxFit.fitHeight,
                        height: 180,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('An error occurred while fetching data',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Fonts.fontSize20,
                          fontWeight: Fonts.f700
                      ),),
                    const Text(
                      "We are trying hard to reach you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: Fonts.fontSize18
                      ),
                    ),
                    const Text(
                      "Stay tuned!",
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
  BlogHomeScreenServerErrorCubit createCubitAndAssignToController(BuildContext context) {
    BlogHomeScreenServerErrorCubit blogHomeScreenServerErrorCubit =
        BlogHomeScreenServerErrorCubit();
    controller?.cubit = blogHomeScreenServerErrorCubit;
    return blogHomeScreenServerErrorCubit;
  }
}




