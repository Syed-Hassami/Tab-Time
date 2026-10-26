import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const EmailTextfield({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  State<EmailTextfield> createState() => _EmailTextfieldState();
}

class _EmailTextfieldState extends State<EmailTextfield> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textstyle = Theme.of(context).textTheme;
    return TextFormField(
      cursorColor: color.secondary,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_rounded, color: color.onPrimary),
        labelText: widget.text,
        labelStyle: textstyle.headlineSmall?.copyWith(color: color.onPrimary),
        fillColor: color.surface,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: color.surface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: color.surface),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please Enter Email';
        }
        if (!value.contains('@')) {
          return 'Please Enter Valid Email';
        }
        return null;
      },
    );
  }
}
