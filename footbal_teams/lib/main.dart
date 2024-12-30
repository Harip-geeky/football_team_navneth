import 'package:flutter/material.dart';
import 'package:footbal_teams/presentation/app.dart';

import 'infrastructure/teams_repo/i_teams_repo.dart';

Future<void> main() async {
  // await TeamsRepository().fetchTeams();
  runApp(const MyApp());
}
