import 'package:flutter/material.dart';
import 'package:footbal_teams/domain/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
onGenerateRoute: Routes.ongenerateRoute,
initialRoute: RoutesPaths.homepage,

    );
  }
}
