import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/base_controller.dart';

abstract class BaseStatelessWidget<T extends BaseController, C extends BlocBase>
    extends StatelessWidget {
  final T? controller;

  const BaseStatelessWidget({this.controller, super.key});

  C createCubitAndAssignToController(BuildContext context);

  // UserAccount? getLoggedUserAccount(BuildContext context) {
  //   AuthenticationCubit authenticationCubit =
  //       BlocProvider.of<AuthenticationCubit>(context);
  //   return authenticationCubit.state.userAccount ?? null;
  // }

  C getCubit(BuildContext context) {
    return BlocProvider.of<C>(context);
  }

  initializeController(BuildContext context) {
    this.controller?.childContext = context;
  }
}
