import 'package:charterapp/bloc/app/app_bloc.dart';
import 'package:charterapp/bloc/app/app_state.dart';
import 'package:charterapp/bloc/charter/charter_bloc.dart';
import 'package:charterapp/services/api_providers/charater_api_provider.dart';
import 'package:charterapp/utils/helper/shared_preferences.dart';
import 'package:charterapp/utils/theme/dark_theme.dart';
import 'package:charterapp/utils/theme/light_theme.dart';
import 'package:charterapp/view/add_charter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  await CharterApiProvider().loginApiProvider();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var brightness;

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.system,
          theme: state is LightThemeState
              ? lightTheme
              : state is DarkThemeState
                  ? darkTheme
                  : darkTheme,
          home: AddCharterScreen(),
        );
      }),
    );
  }
}
