import 'package:flutter/material.dart';

class PersonalisedWorkouts extends StatefulWidget {
  const PersonalisedWorkouts({super.key});

  @override
  State<PersonalisedWorkouts> createState() => _PersonalisedWorkoutsState();
}

class _PersonalisedWorkoutsState extends State<PersonalisedWorkouts> {
  final _formKey = GlobalKey<FormState>();
  String _fitnessLevel = 'Beginner';
  String _goal = 'Weight Loss';
  String _workoutType = 'Cardio';

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('AI Workout Plan'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Fitness Preferences',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              _dropdownField(
                label: "Fitness Level",
                value: _fitnessLevel,
                items: ['Beginner', 'Intermediate', 'Advanced'],
                onChanged: (val) => setState(() => _fitnessLevel = val!),
              ),
              const SizedBox(height: 10),
              _dropdownField(
                label: "Goal",
                value: _goal,
                items: ['Weight Loss', 'Muscle Gain', 'Endurance'],
                onChanged: (val) => setState(() => _goal = val!),
              ),
              const SizedBox(height: 10),
              _dropdownField(
                label: "Workout Type",
                value: _workoutType,
                items: ['Cardio', 'Yoga', 'Strength Training'],
                onChanged: (val) => setState(() => _workoutType = val!),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _loading ? null : _generateWorkoutPlan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Generate Plan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropdownField({
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        DropdownButtonFormField<String>(
          dropdownColor: Colors.grey[900],
          value: value,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[850],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          style: const TextStyle(color: Colors.white),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Future<void> _generateWorkoutPlan() async {
    setState(() => _loading = true);

    // Simulate API call or logic for generating plan
    await Future.delayed(const Duration(seconds: 2));

    final workoutPlan = _generateDynamicPlan(
      level: _fitnessLevel,
      goal: _goal,
      type: _workoutType,
    );

    setState(() => _loading = false);

    // Show workout plan in a dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Your AI Workout Plan'),
        content: SingleChildScrollView(
          child: Text(workoutPlan),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close')),
        ],
      ),
    );
  }

  String _generateDynamicPlan(
      {required String level, required String goal, required String type}) {
    // Base exercises
    String plan = '';

    // Different plans based on the fitness level
    if (level == 'Beginner') {
      plan =
          '🟧 Monday:\n- Warm-up: 5 mins walking\n- Main: 3 sets of 10 squats, lunges\n- Cool down: 5 mins stretching\n';
      plan +=
          '- Additional: 3 sets of 15 standing leg raises, 2 sets of 10 push-ups (modified)\n';
    } else if (level == 'Intermediate') {
      plan =
          '🟧 Monday:\n- Warm-up: 10 mins cardio\n- Main: 4 sets of 12 squats, push-ups, lunges\n- Cool down: 5 mins stretching\n';
      plan +=
          '- Additional: 3 sets of 15 dumbbell rows, 3 sets of 12 jumping jacks\n';
    } else {
      plan =
          '🟧 Monday:\n- Warm-up: 10 mins intense cardio\n- Main: 5 sets of 15 squats, deadlifts, bench press\n- Cool down: Yoga poses\n';
      plan +=
          '- Additional: 4 sets of 20 burpees, 4 sets of 12 dumbbell curls\n';
    }

    // Goal-based adjustments
    if (goal == 'Muscle Gain') {
      plan +=
          '\n💪 Focus on strength exercises for muscle building.\n- Add heavier weight training (dumbbells, barbells) to your routine.\n';
    } else if (goal == 'Weight Loss') {
      plan +=
          '\n🏃‍♀️ Add more cardio sessions (e.g., running, cycling) to help burn fat.\n';
    } else if (goal == 'Endurance') {
      plan +=
          '\n🏋️‍♂️ Increase repetitions and include compound movements to build endurance.\n';
    }

    // Workout Type-based exercises
    if (type == 'Cardio') {
      plan +=
          '\n💥 Cardio Plan:\n- 20 mins treadmill running, 10 mins cycling\n- Additional: 3 sets of mountain climbers, 2 sets of high knees\n';
    } else if (type == 'Yoga') {
      plan +=
          '\n🧘‍♂️ Yoga Plan:\n- 30 mins vinyasa flow session\n- Additional: 2 sets of downward dog, 3 sets of warrior pose\n';
    } else if (type == 'Strength Training') {
      plan +=
          '\n🏋️‍♂️ Strength Training Plan:\n- 4 sets of 12 push-ups, squats, lunges\n- Additional: 3 sets of 10 bent-over rows, 3 sets of shoulder press\n';
    }

    return plan;
  }
}
