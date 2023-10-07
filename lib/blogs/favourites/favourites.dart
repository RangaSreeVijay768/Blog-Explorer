import 'package:blog_explorer/blogs/favourites/favourites_controller.dart';
import 'package:blog_explorer/blogs/favourites/favourites_cubit.dart';
import 'package:blog_explorer/core/widgets/base_stateless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesScreen extends BaseStatelessWidget<FavouritesController, FavouritesCubit>{
  final String id;
  final String title;
  final String image;
  const FavouritesScreen(this.id, this.title, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavouritesCubit>(
        create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<FavouritesCubit, FavouritesState>(
        listener: (context, state){},
        builder: (context, state){
          return const Scaffold();
        },
      )
    );
  }

  @override
  FavouritesCubit createCubitAndAssignToController(BuildContext context) {
    FavouritesCubit favouritesCubit = FavouritesCubit();
    controller?.cubit = favouritesCubit;
    return favouritesCubit;
  }

}