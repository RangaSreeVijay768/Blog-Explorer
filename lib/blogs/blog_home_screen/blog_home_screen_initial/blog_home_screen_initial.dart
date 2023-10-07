import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen_initial/blog_home_screen_initial_controller.dart';
import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen_initial/blog_home_screen_initial_cubit.dart';
import 'package:blog_explorer/core/widgets/base_stateless_widget.dart';
import 'package:blog_explorer/themes/app_colors.dart';
import 'package:blog_explorer/themes/edge_insets.dart';
import 'package:blog_explorer/themes/fonts.dart';
import 'package:blog_explorer/themes/borders.dart';
import 'package:blog_explorer/themes/shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BlogHomeScreenInitial extends BaseStatelessWidget<BlogHomeScreenInitialController, BlogHomeScreenInitialCubit>{
  const BlogHomeScreenInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlogHomeScreenInitialCubit>(
        create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<BlogHomeScreenInitialCubit, BlogHomeScreenInitialState>(
        listener: (context, state){},
        builder: (context, state){
          return Center(
              child: Container(
                height: 200,
                margin: edge_insets_x_30,
                padding: edge_insets_24,
                decoration: BoxDecoration(
                    boxShadow: const [shadows.bs_primary],
                    color: AppColors.white,
                    borderRadius: borderRadius.br_10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.discreteCircle(
                        color: AppColors.bgPrimary,
                        size: 50,
                        secondRingColor: AppColors.bmiTracker,
                        thirdRingColor:
                        AppColors.waterPrimary),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Please wait\nwe are loading data for you..",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: Fonts.f500,
                          fontSize: Fonts.fontSize18
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  @override
  BlogHomeScreenInitialCubit createCubitAndAssignToController(BuildContext context) {
    BlogHomeScreenInitialCubit blogHomeScreenInitialCubit =
        BlogHomeScreenInitialCubit();
    controller?.cubit = blogHomeScreenInitialCubit;
    return blogHomeScreenInitialCubit;
  }
  
}