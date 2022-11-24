import 'package:flutter/material.dart';

class AppPadding extends StatelessWidget {
  final Widget? child;
  final bool commonHorizontalPadding;
  final bool commonVerticalPadding;
  final bool commonAllPadding;
  final bool authScreenPadding;
  final EdgeInsets? padding;

  const AppPadding({this.child, this.padding, Key? key})
      : commonHorizontalPadding = false,
        authScreenPadding = false,
        commonVerticalPadding = false,
        commonAllPadding = false,
        super(key: key);

  const AppPadding.commonHorizontalPadding({this.child, Key? key})
      : commonHorizontalPadding = true,
        commonVerticalPadding = false,
        authScreenPadding = false,
        commonAllPadding = false,
        padding = null,
        super(key: key);

  const AppPadding.commonVerticalPadding({this.child, Key? key})
      : commonHorizontalPadding = false,
        commonVerticalPadding = true,
        authScreenPadding = false,
        commonAllPadding = false,
        padding = null,
        super(key: key);

  const AppPadding.commonAllPadding({this.child, Key? key})
      : commonHorizontalPadding = false,
        commonVerticalPadding = false,
        authScreenPadding = false,
        commonAllPadding = true,
        padding = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsets cusPadding = padding ?? EdgeInsets.zero;
    if (padding == null) {
      if (commonHorizontalPadding == true) {
        cusPadding = EdgeInsets.symmetric(horizontal: 24);
      } else if (commonVerticalPadding == true) {
        cusPadding = EdgeInsets.symmetric(vertical: 24);
      } else if (commonAllPadding == true) {
        cusPadding = cusPadding = const EdgeInsets.all(24);
      }
    }
    return Padding(
      padding: cusPadding,
      child: child,
    );
  }
}
