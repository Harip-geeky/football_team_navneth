import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:footbal_teams/domain/models/teams_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../infrastructure/teams_repo/i_teams_repo.dart';

part 'teams_bloc_event.dart';
part 'teams_bloc_state.dart';
part 'teams_bloc_bloc.freezed.dart';

class TeamsBlocBloc extends Bloc<TeamsBlocEvent, TeamsBlocState> {
  TeamsRepository repo = TeamsRepository();
  TeamsBlocBloc() : super(TeamsBlocState.intial()) {
    on<TeamsBlocEvent>((event, emit) async {
      final responce = await repo.fetchTeams();
      event.map(
        started: (value) {},
        fetchData: (value) async {
          log("ccc");
          try {
            responce.fold((left) {}, (right) {
              log(right.toString());
              emit(state.copyWith(isLoading: false, data: right));
            });
          } catch (e) {}
        },
      );
    });
  }
}
