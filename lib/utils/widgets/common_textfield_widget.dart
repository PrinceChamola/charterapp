import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? obscureValue;
  final BoxBorder? gradientBorder;
  final TextInputAction? textInputAction;

  const CommonTextField(
      {Key? key,
        this.hintText,
        this.textEditingController,
        this.onChanged,
        this.suffixIcon,
        this.obscureValue,
        this.gradientBorder,
        this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor
      ),
      child: TextField(
        textInputAction: textInputAction ?? TextInputAction.next,
        obscureText: obscureValue ?? false,
        onChanged: onChanged ?? (value) {},

        controller: textEditingController,
        cursorColor: Theme.of(context).primaryColor,
        style: TextStyle(color: Theme.of(context).primaryColor),
        decoration: InputDecoration(
            suffixIcon: suffixIcon ?? const SizedBox.shrink(),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20
            ),
            hintText: hintText ?? '',
            hintStyle: Theme.of(context).textTheme.headline4?.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).hintColor),
            fillColor: Colors.white,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}

