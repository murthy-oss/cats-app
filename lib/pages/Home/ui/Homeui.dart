import 'package:cats_app/pages/Home/bloc/home_page_bloc.dart';
import 'package:cats_app/pages/Home/repo/datafetchrepo.dart';
import 'package:cats_app/pages/Home/ui/detailedfact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> result = [];
  final _homepagebloc=HomePageBloc();
  
  @override
  void initState() {
    // TODO: implement initState
  _homepagebloc.add(HomePageInitialFetchEvent());
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: '1',
              ),
              Tab(
                text: '2',
              ),
              Tab(
                text: '3',
              ),
              Tab(
                text: '4',
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          Text("tab1"),
          Text("tab2"),
          BlocConsumer<HomePageBloc, HomePageState>(
          bloc: _homepagebloc,
            listener: (context, state) {
             
            },
            builder: (context, state)
             {
             switch(state.runtimeType)
             
             {
              case FactsSuccessState:
              final successState = state as FactsSuccessState;
                      return ListView.builder(
                itemCount: successState.facts.length,
                itemBuilder: (context, index) {
                  return Center(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Detailedfact(successState.facts[index])));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(successState.facts[index]),
                          )));
                },
              );
               case FactsLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return SizedBox();
           };
            },
  
          ),
          Text("tab4"),
        ]),
      ),
    );
  }
}
