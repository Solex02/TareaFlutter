import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30, // Tamaño fijo del botón
      height: 30, // Tamaño fijo del botón
      child: IconButton(
        icon: Image.asset(icon),
        iconSize: 50,
        onPressed: onPressed,
         // Llama al callback onPressed cuando se presiona el botón
      ),
    );
  }
}
