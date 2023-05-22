import 'package:flutter/material.dart';
import 'package:flutter_code_test/pages/congrats_page.dart';
import 'package:flutter_code_test/widgets/input_text_field.dart';
import 'package:flutter_code_test/widgets/primary_button.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/details';

  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String name = "";
  String dob = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Enter your details",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              InputTextWidget(
                keyboardType: TextInputType.name,
                placeholderText: "Your name",
                onChanged: (name) {
                  this.name = name;
                },
              ),
              const SizedBox(height: 10),
              InputTextWidget(
                keyboardType: TextInputType.datetime,
                placeholderText: "Your date of birth",
                onChanged: (dob) {
                  this.dob = dob;
                },
              ),
              const SizedBox(height: 10),
              InputTextWidget(
                keyboardType: TextInputType.visiblePassword,
                placeholderText: "Your password",
                isSecure: true,
                onChanged: (password) {
                  this.password = password;
                },
              ),
              const SizedBox(height: 10),
              PrimaryButton(
                title: "Submit",
                onTap: () async {
                  final result = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Wait!'),
                      content: Text(
                          'Are these details correct? \n\nName: $name\nDate of birth: $dob\nYour plan: ${arguments['plan-name']}'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'No'),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Yes'),
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                  if (result == "Yes") {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacementNamed(
                      CongratsPage.routeName,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
