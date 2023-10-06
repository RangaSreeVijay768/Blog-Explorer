import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen.dart';
import 'package:blog_explorer/blogs/blog_home_screen/blog_home_screen_cubit.dart';
import 'package:blog_explorer/core/controllers/base_controller.dart';
import 'package:blog_explorer/core/widgets/base_stateless_widget.dart';
import 'package:blog_explorer/onboarding/onboarding_welcome_screen/onboarding_welcome_screen_cubit.dart';
import 'package:blog_explorer/themes/app_colors.dart';
import 'package:blog_explorer/themes/edge_insets.dart';
import 'package:blog_explorer/themes/fonts.dart';
import 'package:blog_explorer/themes/borders.dart';
import 'package:blog_explorer/themes/shadows.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class OnboardingWelcomeScreen extends BaseStatelessWidget<OnboardingWelcomeScreenController, OnboardingWelcomeScreenCubit> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingWelcomeScreenCubit>(
        create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<OnboardingWelcomeScreenCubit, OnboardingWelcomeScreenState>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
            body: Container(
              // padding: edge_insets_t_170,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg12.png"),
                  fit: BoxFit.cover,
                ),
              ),
              // padding: EdgeInsets.all(30.0),
              child: Container(
                  margin: edge_insets_16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlurryContainer(
                        // color: AppColors.transparent,
                        blur: 3,
                        padding: edge_insets_0,
                        child: Container(
                          padding: edge_insets_x_16_y_24,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.center,
                                  colors: [
                                    AppColors.bgLightBlue,
                                    AppColors.white012,
                                    AppColors.white018
                                  ]),
                              border: borders.b_1px_bgPrimary,
                              borderRadius: borderRadius.br_20),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // alignment: Alignment.center,
                                height: 200,
                                // margin: edge_insets_16,
                                decoration: BoxDecoration(
                                    color:
                                    AppColors.bgLightBlue,
                                    borderRadius:
                                    borderRadius.br_20,

                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage('images/brain.png'))),
                              ),

                              Container(
                                padding: edge_insets_t_24,
                                child: const Text(
                                  "Welcome to Blog Explorer",
                                  style: TextStyle(
                                    color: AppColors.textHeading,
                                    fontSize: Fonts.fontSize24,
                                    fontFamily: Fonts.fontNunito,
                                    fontWeight: Fonts.f700,
                                  ),
                                ),
                              ),
                              Container(
                                padding: edge_insets_t_16,
                                child: const Text(
                                  "Explore interested blogs to get relaxed and refresh your mind",
                                  style: TextStyle(
                                    color: AppColors.grey2,
                                    fontSize: Fonts.fontSize14,
                                    fontFamily: Fonts.fontNunito,
                                    fontWeight: Fonts.f400,
                                  ),
                                ),
                              ),
                              Container(
                                margin: edge_insets_t_40,
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  // onHover: HSLColor.fromColor(Colors.black),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: borderRadius.br_30),
                                      padding: edge_insets_x_80_y_14,
                                      backgroundColor: AppColors.white),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BlogHomeScreen()));
                                  },
                                  child: const Text(
                                    "Explore",
                                    style: TextStyle(
                                      color: AppColors.bgPrimary,
                                      fontFamily: Fonts.fontNunito,
                                      fontSize: Fonts.fontSize18,
                                      fontWeight: Fonts.f700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          );
        },
      )
    );
  }

  @override
  OnboardingWelcomeScreenCubit createCubitAndAssignToController(BuildContext context) {
    OnboardingWelcomeScreenCubit onboardingWelcomeScreenCubit =
        OnboardingWelcomeScreenCubit();
    controller?.cubit = onboardingWelcomeScreenCubit;
    return onboardingWelcomeScreenCubit;
  }
}








class OnboardingWelcomeScreenController extends BaseController<OnboardingWelcomeScreenCubit>{}