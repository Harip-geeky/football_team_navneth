part of 'teams_bloc_bloc.dart';

@freezed
class TeamsBlocState with _$TeamsBlocState {
  const factory TeamsBlocState({
    required bool isLoading,
    required String errorMessage,
    required List<TeamsModel> data,
  }) = _TeamsBlocState;
  factory TeamsBlocState.intial() {
    return TeamsBlocState(data: [], isLoading: true, errorMessage: '');
  }
}
