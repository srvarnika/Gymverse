import 'package:flutter/material.dart';
import 'package:gymverse_frontend/services/tensorflow_service.dart'; // Import your TensorFlowService

class WorkoutPlanGenerator extends StatefulWidget {
  const WorkoutPlanGenerator({super.key}); // No 'user' parameter anymore

  @override
  _WorkoutPlanGeneratorState createState() => _WorkoutPlanGeneratorState();
}

class _WorkoutPlanGeneratorState extends State<WorkoutPlanGenerator> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String gender = 'Male';
  int? calorieEstimate;
  bool isLoading = false;

  Future<void> generatePlan() async {
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);
    final age = int.tryParse(ageController.text);

    if (weight == null || height == null || age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields correctly.")),
      );
      return;
    }

    setState(() {
      isLoading = true;
      calorieEstimate = null;
    });

    try {
      final genderFlag = gender == 'Male' ? 1 : 0;

      // Call the TensorFlowService to predict calories
      final result = await TensorFlowService.predictCalories(
        weight: weight,
        height: height,
        age: age,
        gender: genderFlag,
      );

      setState(() {
        calorieEstimate = result;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text("AI Workout Calorie Estimator"),
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              buildLabel("Weight (kg)"),
              buildInputField(weightController),
              buildLabel("Height (cm)"),
              buildInputField(heightController),
              buildLabel("Age (years)"),
              buildInputField(ageController),
              buildLabel("Gender"),
              buildGenderDropdown(),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: generatePlan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF6A400),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Estimate Calories",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else if (calorieEstimate != null)
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B2B2B),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Estimated daily calories: $calorieEstimate kcal",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFFF6A400),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLabel(String label) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white70, fontSize: 14, fontFamily: 'Roboto'),
      ),
    );
  }

  Widget buildInputField(TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF333333),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF6A400)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget buildGenderDropdown() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF444444)),
      ),
      child: DropdownButton<String>(
        dropdownColor: const Color(0xFF1E1E1E),
        value: gender,
        underline: Container(),
        isExpanded: true,
        iconEnabledColor: Colors.white,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: 'Roboto'),
        onChanged: (value) {
          setState(() {
            gender = value!;
          });
        },
        items: ['Male', 'Female']
            .map((g) => DropdownMenuItem(
                  value: g,
                  child: Text(g),
                ))
            .toList(),
      ),
    );
  }
}
