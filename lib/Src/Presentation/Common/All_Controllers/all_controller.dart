import 'package:flutter/material.dart';

class AllController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void dispose() {
    emailController.clear();
    passwordController.clear();
  }
}
