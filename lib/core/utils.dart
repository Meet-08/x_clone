import 'package:flutter/material.dart';

String formateError(Object error) {
  if (error.toString().startsWith("Exception: ")) {
    return error.toString().substring(11);
  }

  return error.toString();
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.red)),
    ),
  );
}
