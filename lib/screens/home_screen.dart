import 'package:flutter/material.dart';
import 'workout_plan_generator.dart';
import 'workout_details_screen.dart'; // Workout Details
import 'profile_screen.dart'; // Profile
import 'personalised_workouts.dart'; // Personalised Workouts

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1C1C1C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              // Center the content
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the Column
                  crossAxisAlignment: CrossAxisAlignment
                      .center, // Center the content inside the column
                  children: [
                    // App Title
                    const Text(
                      "GymVerse",
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF6600),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Unleash Your Inner Beast",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(
                        height: 30), // Adjusted space between title and grid

                    // Feature Cards Grid (2x2 layout)
                    GridView.builder(
                      shrinkWrap: true, // Prevents scrolling of the entire body
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.4,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return _featureCard(
                              context,
                              title: "AI Nutrition Plan",
                              subtitle: "Get calorie estimates",
                              icon: Icons.fitness_center_rounded,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WorkoutPlanGenerator(),
                                  ),
                                );
                              },
                            );
                          case 1:
                            return _featureCard(
                              context,
                              title: "AI Workout Plan",
                              subtitle: "Get your personalized plan",
                              icon: Icons.auto_awesome_rounded,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PersonalisedWorkouts(),
                                  ),
                                );
                              },
                            );
                          case 2:
                            return _featureCard(
                              context,
                              title: "Workouts",
                              subtitle: "Explore different workout types",
                              icon: Icons.sports_gymnastics_rounded,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        WorkoutDetailsScreen(),
                                  ),
                                );
                              },
                            );
                          case 3:
                            return _featureCard(
                              context,
                              title: "Profile",
                              subtitle: "View and edit your profile",
                              icon: Icons.person_rounded,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfileScreen(),
                                  ),
                                );
                              },
                            );
                          default:
                            return Container(); // Empty container if index is out of bounds
                        }
                      },
                    ),
                    const SizedBox(height: 30), // Space for footer

                    // Footer
                    const Text(
                      "Team GymVerse",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Feature card widget
  Widget _featureCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.orange.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2C),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFFFF6600), size: 36),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Georgia',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 10,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
