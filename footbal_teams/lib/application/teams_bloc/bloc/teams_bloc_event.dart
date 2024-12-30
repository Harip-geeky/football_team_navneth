part of 'teams_bloc_bloc.dart';

@freezed
class TeamsBlocEvent with _$TeamsBlocEvent {
  const factory TeamsBlocEvent.started() = _Started;
    const factory TeamsBlocEvent.fetchData() = _FetchData;


}