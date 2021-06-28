import 'package:flutter/material.dart';

class CommonSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final String title;
  final Color buttonColor;
  final Color textColor;

  CommonSignInButton({this.title: "", this.onPressed, this.width, this.buttonColor: Colors.blue, this.textColor: Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return Colors.grey;
            return buttonColor; // Use the component's default.
          },
        ),
      ),
      child: Container(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon here
            Text(
              title,
              style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
