import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CongratsPage extends StatelessWidget {
  static const routeName = '/congrats';
  const CongratsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      "Congratulations!",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "You are now a GoGet member!",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 150,
                          height: 150,
                          child: Icon(Icons.ac_unit,
                              size: 50, color: Colors.black),
                        ),
                        Column(
                          children: [
                            const Text(
                              "Random Cat fact",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            FutureBuilder<String>(
                              future: _randomCatFact(),
                              builder: (context, snapshot) => snapshot.hasData
                                  ? SizedBox(
                                      width: 200,
                                      child: Text(
                                        snapshot.data ?? "",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    )
                                  : const Text("No Data"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _randomCatFact() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse('https://catfact.ninja/fact'));
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var fact = decodedResponse['fact'] as String;
      return Future.value(fact);
    } finally {
      client.close();
    }
  }
}
