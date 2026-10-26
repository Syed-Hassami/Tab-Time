import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tab_time/Src/Presentation/Common/All_Controllers/all_controller.dart';
import 'package:tab_time/Src/Presentation/Common/Common_Button/common_button.dart';
import 'package:tab_time/Src/Presentation/Widgets/Auth/Component/email_textfield.dart';
import 'package:tab_time/Src/Presentation/Widgets/Auth/Component/name_textfield.dart';
import 'package:tab_time/Src/Presentation/Widgets/Auth/Component/password_textfield.dart';
import 'package:tab_time/Src/Presentation/Widgets/Auth/Login_Screen/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AllController controller = AllController();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textstyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: color.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 50),
                Icon(
                  Icons.medical_services_rounded,
                  size: 70,
                  color: color.onPrimary,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Create Your Account\n',
                        style: textstyle.headlineLarge?.copyWith(
                          color: color.onPrimary,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Start building healthier medication habits today.',
                        style: textstyle.displayMedium?.copyWith(
                          color: color.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                NameTextfield(
                  controller: controller.nameController,
                  text: 'Name',
                ),
                SizedBox(height: 20.h),
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
                SizedBox(height: 30.h),
                CommonButton(text: 'LogIn', ontap: () {}),
                SizedBox(height: 30.h),
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
                      style: textstyle.bodySmall?.copyWith(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account',
                      style: textstyle.displayMedium?.copyWith(
                        color: color.onPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'SignIn',
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
        ),
      ),
    );
  }
}
