import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onPressed;

  const CronometroBotao({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          textStyle: const TextStyle(fontSize: 25)),
      onPressed: onPressed,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(icon, size: 35),
          ),
          Text(label),
        ],
      ),
    );
  }
}
