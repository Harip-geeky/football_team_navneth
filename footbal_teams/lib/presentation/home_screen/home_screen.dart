import 'package:easy_infinite_pagination/easy_infinite_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footbal_teams/application/teams_bloc/bloc/teams_bloc_bloc.dart';
import 'package:footbal_teams/domain/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TeamsBlocBloc>().add(TeamsBlocEvent.fetchData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<TeamsBlocBloc, TeamsBlocState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(
                        child: SizedBox(
                            // height: 30,
                            child: CircularProgressIndicator()));
                  } else {
                    return InfiniteGridView(
                      delegate: PaginationDelegate(
                        itemCount: state.data.first.teams!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  RoutesPaths.detailScreen,
                                  arguments: state.data!.first!.teams![index]);
                            },
                            child: Container(
                              margin: EdgeInsets.all(7),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(26),
                                child: Image.network(
                                  state.data!.first!.teams![index].flag
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          );
                        },
                        onFetchData: () {},
                      ),
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.9),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
