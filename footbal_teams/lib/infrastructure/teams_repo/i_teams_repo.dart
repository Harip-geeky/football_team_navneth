import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:footbal_teams/domain/errors/errors.dart';
import 'package:footbal_teams/domain/models/teams_model.dart';

import '../../domain/api/endpoints.dart';

abstract class ITeamsRepo {
  Future<Either<BaseError, List<TeamsModel>>> fetchTeams();
}

// expected a factory constructor or a get_it injectable for a singleton Return in Future

class TeamsRepository implements ITeamsRepo {
  @override
  Future<Either<BaseError, List<TeamsModel>>> fetchTeams() async {
    final dio = Dio();

    try {
      final responce = await dio.get(Endpoints.teams);
      log("ccc1");
      print(responce);

      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final data = TeamsModel.fromJson(responce.data);
        print(data.teams!.first.id);
        return Right([data]);
      } else {
        return Left(DataFetchError(errorMessage: 'Error Fetching Data'));
      }
    } catch (e) {
      return Left(NoInternetError(errorMessage: 'There is no Internet'));
    }
  }
}
