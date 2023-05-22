import 'package:flutter/material.dart';
import 'package:flutter_code_test/pages/plans_page.dart';
import 'package:flutter_code_test/widgets/input_text_field.dart';
import 'package:flutter_code_test/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    "Welcome to GoGetIt",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  InputTextWidget(
                    keyboardType: TextInputType.emailAddress,
                    placeholderText: "Email address",
                    onChanged: (email) {
                      this.email = email;
                    },
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                      title: "Register",
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                          PlansPage.routeName,
                          arguments: {
                            'email': email,
                          },
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
