import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/about_screen_bloc/about_screen_bloc.dart';
import 'package:test_app/blocs/main_screen_bloc/main_screen_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainScreenBloc = context.read<MainScreenBloc>();
    final aboutScreenBloc = context.read<AboutScreenBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('main screen'),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BlocBuilder<MainScreenBloc, MainScreenState>(
              bloc: mainScreenBloc,
              builder: (context, state) {
                context.read<MainScreenBloc>().add(InitialEvent());
                if (state is MainScreenLoadedDataState) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          aboutScreenBloc.add(SelectTitleEvent(index));
                          Navigator.of(context).pushNamed('/about_screen');
                        },
                        title: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.listOfNames[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
