import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bmi_calculator/data/models/bmi_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  List<BmiModel> bmiList = List.empty(growable: true);

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 65, 61, 61)),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 400,
              height: 100,
              color: Colors.black,
              child: const Center(
                child: Text(
                  "BMI Calculator",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Height: ",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                "cm",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Mass: ",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                "kg",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                String height = heightController.text.trim();
                String weight = weightController.text.trim();
                BmiModel(height, weight);

                double h = double.parse(height) * 0.01;
                double w = double.parse(weight);

                double bmi = w / pow(h, 2);

                String output;

                if (bmi <= 15.949) {
                  output = "Very Severely Underweight";
                } else if (bmi > 15.949 && bmi < 16.949) {
                  output = "Severely Underweight";
                } else if (bmi > 16.949 && bmi < 18.449) {
                  output = "Underweight";
                } else if (bmi > 18.449 && bmi < 24.949) {
                  output = "Normal";
                } else if (bmi > 24.949 && bmi < 29.949) {
                  output = "Overweight";
                } else if (bmi > 29.949 && bmi < 34.949) {
                  output = "Obese Class I";
                } else if (bmi > 34.949 && bmi < 39.949) {
                  output = "Obese Class II";
                } else if (bmi >= 39.949) {
                  output = "Obese Class III";
                } else {
                  output = "Error";
                }

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Result: ",
                                style: TextStyle(fontSize: 22),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            bmi.toStringAsFixed(1),
                            style: const TextStyle(fontSize: 50),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            output,
                            style: const TextStyle(fontSize: 22),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Close"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}
