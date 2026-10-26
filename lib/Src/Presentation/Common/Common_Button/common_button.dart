import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({super.key, required this.text, required this.ontap});
  final String text;
  final VoidCallback ontap;
  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textstyle = Theme.of(context).textTheme;
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: color.onPrimary,
        ),
        child: Center(child: Text(widget.text,style:textstyle.headlineSmall?.copyWith(color: color.surface),)),
      ),
    );
  }
}
