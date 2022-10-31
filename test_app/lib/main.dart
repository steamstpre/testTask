import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/about_screen_bloc/about_screen_bloc.dart';
import 'package:test_app/blocs/main_screen_bloc/main_screen_bloc.dart';
import 'package:test_app/services/dependency_injection_service/dependency_injection.dart';
import 'package:test_app/services/navigation/on_generate_route.dart';

void main() {
  DependencyInjection dependencyInjection = DependencyInjection();
  dependencyInjection.setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainScreenBloc(),
        ),
        BlocProvider(
          create: (context) => AboutScreenBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
