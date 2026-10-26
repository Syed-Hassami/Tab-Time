import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const PasswordTextfield({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textstyle = Theme.of(context).textTheme;
    return TextFormField(
      obscureText: true,
      obscuringCharacter: '*',
      cursorColor: color.secondary,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_rounded, color: color.onPrimary),
        suffixIcon: Icon(Icons.visibility, color: color.onPrimary),
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
          return 'Please Enter Password';
        }
        if (value.length < 6) {
          return 'Please Enter atleast 6 charactors';
        }
        return null;
      },
    );
  }
}
