import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/about_screen_bloc/about_screen_bloc.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aboutScreenBloc = context.read<AboutScreenBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("about user"),
      ),
      body: Stack(
        children: [
          BlocBuilder<AboutScreenBloc, AboutScreenState>(
            bloc: aboutScreenBloc,
            builder: (context, state) {
              if (state is LoadDataAboutState) {
                return Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(state.model.body!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0, left: 8, right: 8),
                    child: Center(child: Text(state.model.title)),
                  )
                ]);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
