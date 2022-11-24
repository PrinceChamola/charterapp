import 'dart:async';

import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 4.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegularOne = SizedBox(
  height: 16.0,
);
const Widget horizontalSpaceRegular = SizedBox(width: 20.0);
const Widget horizontalSpaceMedium = SizedBox(width: 30.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

const Widget verticalSpaceTiny = SizedBox(height: 4.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegularOne = SizedBox(
  height: 16.0,
);
const Widget verticalSpaceRegular = SizedBox(height: 20.0);
const Widget verticalSpaceMedium = SizedBox(height: 30.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);

Widget topViewPadding(BuildContext context) =>
    SizedBox(height: MediaQuery.of(context).viewPadding.top);

Widget bottomViewPadding(BuildContext context) => SizedBox(
  height: MediaQuery.of(context).viewPadding.bottom,
);

class Debouncer {
  final int? milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds!), action);
  }
}
