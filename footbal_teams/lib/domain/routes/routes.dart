import 'package:flutter/material.dart';
import 'package:footbal_teams/application/teams_bloc/bloc/teams_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footbal_teams/presentation/detail_screen/detail_screen.dart';

import '../../presentation/home_screen/home_screen.dart';
import '../models/teams_model.dart';

abstract class RoutesPaths {
  static const String homepage = '/home_page';
  static const String detailScreen = '/detail_screen';
}

class Routes {
  static Route<dynamic> ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesPaths.homepage:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => TeamsBlocBloc(),
              child: HomeScreen(),
            );
          },
        );

      case RoutesPaths.detailScreen:
        final data = settings.arguments as Teams;

        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => TeamsBlocBloc(),
              child: DetailScreen(data: data,),
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold();
          },
        );
    }
  }
}
