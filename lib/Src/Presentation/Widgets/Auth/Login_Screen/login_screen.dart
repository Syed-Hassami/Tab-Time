import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tab_time/Src/Presentation/Common/All_Controllers/all_controller.dart';
import 'package:tab_time/Src/Presentation/Common/Common_Button/common_button.dart';
import 'package:tab_time/Src/Presentation/Widgets/Auth/Component/email_textfield.dart';
import 'package:tab_time/Src/Presentation/Widgets/Auth/Component/password_textfield.dart';
import 'package:tab_time/Src/Presentation/Widgets/Auth/SignUp/signup_screen.dart';
import 'package:tab_time/Src/Presentation/Widgets/Health_Info/health_info.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AllController controller = AllController();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textstyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: color.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.watch_later_rounded, size: 70, color: color.onPrimary),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome Back!\n',
                    style: textstyle.headlineLarge?.copyWith(
                      color: color.onPrimary,
                    ),
                  ),
                  TextSpan(
                    text: 'Stay on track with your medication.',
                    style: textstyle.displayMedium?.copyWith(
                      color: color.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            EmailTextfield(
              controller: controller.emailController,
              text: 'Email',
            ),
            SizedBox(height: 20.h),
            PasswordTextfield(
              controller: controller.passwordController,
              text: 'Password',
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'forget password ?',
                  style: textstyle.headlineSmall?.copyWith(
                    color: color.onPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CommonButton(
              text: 'LogIn',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HealthInfo()),
                );
              },
            ),
            SizedBox(height: 50.h),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: color.onPrimary,
                    endIndent: 5,
                  ),
                ),
                Text(
                  'OR',
                  style: textstyle.displayMedium?.copyWith(
                    color: color.onPrimary,
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: color.onPrimary,
                    indent: 5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                _showDialog();
              },
              child: Text(
                'LogIn with',
                style: textstyle.displayMedium?.copyWith(
                  color: color.onPrimary,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an Account",
                  style: textstyle.displayMedium?.copyWith(
                    color: color.onPrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    'SignUp',
                    style: textstyle.displayMedium?.copyWith(
                      color: color.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    final textstyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'How to LogIn',
            style: textstyle.displayMedium?.copyWith(color: color.onPrimary),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: CircleAvatar(
                  radius: 17.r,
                  backgroundImage: const AssetImage('assets/image/google.png'),
                ),
                title: Text(
                  'Google',
                  style: textstyle.displayMedium?.copyWith(
                    color: color.onPrimary,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 30.w,
                horizontalTitleGap: 12.w,
                leading: ClipOval(
                  child: Image.asset(
                    'assets/image/facebook.png',
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  'FaceBook',
                  style: textstyle.displayMedium?.copyWith(
                    color: color.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
