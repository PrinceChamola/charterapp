
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff0CABDF).withOpacity(0.25),
              offset: Offset(0, 10),
              blurRadius: 20
            )
          ],
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text("Continue"),
      ),
    );
  }
}
