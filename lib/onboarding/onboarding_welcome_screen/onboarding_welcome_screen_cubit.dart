import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_welcome_screen_state.dart';
part 'onboarding_welcome_screen_cubit.freezed.dart';

class OnboardingWelcomeScreenCubit extends Cubit<OnboardingWelcomeScreenState> {
  OnboardingWelcomeScreenCubit() : super(const OnboardingWelcomeScreenState.initial());
}
