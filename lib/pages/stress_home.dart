import 'package:flutter/material.dart';
import '../utils/kalman_filter.dart';

class StressHome extends StatefulWidget {
  const StressHome({super.key});

  @override
  State<StressHome> createState() => _StressHomeState();
}

class _StressHomeState extends State<StressHome> {
  final KalmanFilter kalmanFilter = KalmanFilter();

  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  double filteredGsr = 0.0;
  String stressLevel = "—";

  void calculateStress() {
    for (var controller in controllers) {
      if (controller.text.isNotEmpty) {
        double value = double.tryParse(controller.text) ?? 0.0;
        filteredGsr = kalmanFilter.filter(value);
      }
    }

    stressLevel = classifyStress(filteredGsr);
    setState(() {});
  }

  String classifyStress(double gsrNorm) {
    if (gsrNorm <= 200) return "No Stress";
    if (gsrNorm <= 300) return "Moderate Stress";
    if (gsrNorm <= 400) return "High Stress";
    return "Very High Stress";
  }

  Color stressColor() {
    switch (stressLevel) {
      case "No Stress":
        return Colors.green;
      case "Moderate Stress":
        return Colors.orange;
      case "High Stress":
        return Colors.red;
      case "Very High Stress":
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text("Stress Detection – Multi Input Test"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ===== MULTIPLE INPUTS =====
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: List.generate(controllers.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextField(
                        controller: controllers[index],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "GSR Input ${index + 1}",
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculateStress,
              child: const Text("Process Inputs"),
            ),

            const SizedBox(height: 25),

            // ===== FILTERED OUTPUT =====
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Final Filtered GSR",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      filteredGsr.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ===== STRESS RESULT =====
            Card(
              color: stressColor(),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const Text(
                      "Stress Level",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      stressLevel,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
