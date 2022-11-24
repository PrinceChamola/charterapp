import 'package:charterapp/bloc/app/app_bloc.dart';
import 'package:charterapp/bloc/app/app_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app/app_state.dart';

class CupertionSwitchMode extends StatefulWidget {
   const CupertionSwitchMode({Key? key}) : super(key: key);

  @override
  State<CupertionSwitchMode> createState() => _CupertionSwitchModeState();
}

class _CupertionSwitchModeState extends State<CupertionSwitchMode> {
  bool buttonValue = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(),
      child: CupertinoSwitch(
          thumbColor:  Colors.white,
          activeColor: Colors.black,
          trackColor: Theme.of(context).primaryColor.withOpacity(0.5),
          value:context.watch<AppBloc>().state is LightThemeState,
          onChanged: (value) {
            setState(() {
              buttonValue = value;
            });
            if (Theme.of(context).brightness == Brightness.light) {
              context.read<AppBloc>().add(DarkThemeEvent());
            } else {
              context.read<AppBloc>().add(LightThemeEvent());
            }
          }),
    );
  }
}
