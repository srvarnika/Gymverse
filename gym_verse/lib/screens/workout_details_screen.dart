import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final Map<String, List<Map<String, String>>> workoutCategories = {
    'Yoga': [
      {
        'name': 'Surya Namaskar',
        'description': 'A sequence of 12 powerful yoga poses.',
        'image':
            'https://media.istockphoto.com/id/545122356/photo/woman-practicing-yoga-in-india.jpg?s=1024x1024&w=is&k=20&c=-wSv2qyHgQFDum704W8lNwXyfuOkGbiegESU6brKH-k=',
        'url': 'https://www.youtube.com/watch?v=6IUyY9Dyr5w'
      },
      {
        'name': 'Downward Dog',
        'description': 'Lift hips toward ceiling, straighten legs.',
        'image':
            'https://media.istockphoto.com/id/628497814/photo/athlete-in-downward-facing-dog-position-on-shore.jpg?s=612x612&w=0&k=20&c=rGvSEGuI2z2vvvI0gi4jRoEXTRLVoP4DvpQJuWtmjIs=',
        'url': 'https://www.youtube.com/watch?v=0Fx8R9CkSkg'
      },
      {
        'name': 'Cobra Pose',
        'description': 'Lift chest upward from the ground.',
        'image':
            'https://media.istockphoto.com/id/1134841010/photo/young-woman-practicing-yoga-lying-in-cobra-pose-bhujangasana.jpg?s=612x612&w=0&k=20&c=DxJpmMn1B-_6se-OpqwpvfOI9yE3NOCWUVg855yeHzU=',
        'url': 'https://www.youtube.com/watch?v=RDUpy5_6l4c'
      },
      {
        'name': 'Tree Pose',
        'description': 'Stand on one foot and balance.',
        'image':
            'https://media.istockphoto.com/id/589554884/photo/woman-in-yoga-asana-vrikshasana-tree-pose-in-mountains-outdoors.jpg?s=612x612&w=0&k=20&c=ohUiTrrVA6A1G2WvxThRoahAO2EfcIGWTlr1F9FGYBE=',
        'url': 'https://www.youtube.com/watch?v=HgfPTGW0G_A'
      },
      {
        'name': 'Bridge Pose',
        'description': 'Lift hips upward while lying on back.',
        'image':
            'https://media.istockphoto.com/id/674564280/photo/young-attractive-woman-in-glute-bridge-pose-white-loft-studio.jpg?s=612x612&w=0&k=20&c=ZpEpWZc6fcxeG-uKFaTsN_Hc-fmPOvNgVSka-7ZwAeg=',
        'url': 'https://www.youtube.com/watch?v=qTgAMW1aENg'
      }
    ],
    'Calisthenics': [
      {
        'name': 'Push-Ups',
        'description': 'Lower body and push up with straight form.',
        'image':
            'https://media.istockphoto.com/id/1368073690/photo/shot-of-a-muscular-young-man-exercising-with-dumbbells-outdoors.jpg?s=612x612&w=0&k=20&c=bmBxvM-LMI1fwxwEpgmBWEgEbIAd9khjn0lOEgdjkYE=',
        'url': 'https://www.youtube.com/watch?v=IODxDxX7oi4'
      },
      {
        'name': 'Pull-Ups',
        'description': 'Pull yourself up until chin clears bar.',
        'image':
            'https://media.istockphoto.com/id/1028271392/photo/muscular-man-training-his-back.jpg?s=612x612&w=0&k=20&c=osNOzRBERLXKCG6Ugcr8uOdNBICFnolYixDE8S28M08=',
        'url': 'https://www.youtube.com/watch?v=eGo4IYlbE5g'
      },
      {
        'name': 'Dips',
        'description': 'Lower and lift body using triceps.',
        'image':
            'https://media.istockphoto.com/id/2152634392/photo/one-man-muscular-male-athlete-training-dips-outdoor-in-sunny-day.jpg?s=612x612&w=0&k=20&c=SKnvt6mrIF_kfcij32YgiJStUFCJcuEqaJHmvjz8AMg=',
        'url': 'https://www.youtube.com/watch?v=2z8JmcrW-As'
      },
      {
        'name': 'Planks',
        'description': 'Hold a strong forearm plank.',
        'image':
            'https://media.istockphoto.com/id/506760290/photo/plank-it.jpg?s=612x612&w=0&k=20&c=LyLNA1J-mXmB3JwoxyvcRYhCjQfp0n6LV_jMBjdO9ys=',
        'url': 'https://www.youtube.com/watch?v=pSHjTRCQxIw'
      },
      {
        'name': 'Lunges',
        'description': 'Bend both knees to 90° as you step forward.',
        'image':
            'https://media.istockphoto.com/id/1036780614/photo/lunging-is-good-for-the-legs.jpg?s=612x612&w=0&k=20&c=VuajT0dCbTIXGCkX6EMBBvq9yExTOLWwu0fN-9txWs8=',
        'url': 'https://www.youtube.com/watch?v=QOVaHwm-Q6U'
      }
    ],
    'Weight Training': [
      {
        'name': 'Bench Press',
        'description': 'Push barbell while lying on bench.',
        'image':
            'https://media.istockphoto.com/id/1028273740/photo/man-during-bench-press-exercise.jpg?s=612x612&w=0&k=20&c=pTNDqP6UbgTm39u9GHFqDiH13o1cm1l4xYHBdoiSdkg=',
        'url': 'https://www.youtube.com/watch?v=gRVjAtPip0Y'
      },
      {
        'name': 'Barbell Squats',
        'description': 'Squat with barbell on your shoulders.',
        'image':
            'https://media.istockphoto.com/id/1362390816/photo/young-man-performing-heavy-back-squats-exercise-in-gym.jpg?s=612x612&w=0&k=20&c=Rlx05PXD3oHZiK0d944zBlxuDplUD7h51yX-9HyrvJQ=',
        'url': 'https://www.youtube.com/watch?v=Dy28eq2PjcM'
      },
      {
        'name': 'Deadlifts',
        'description': 'Lift barbell from ground to hips.',
        'image':
            'https://media.istockphoto.com/id/838386570/photo/strong-man-doing-deadlift-training-in-gym.jpg?s=612x612&w=0&k=20&c=ok5sL3Fr8dos-fthuxQkjTZsIRN9mu0bhNE4RODC9CI=',
        'url': 'https://www.youtube.com/watch?v=op9kVnSso6Q'
      },
      {
        'name': 'Shoulder Press',
        'description': 'Press dumbbells overhead.',
        'image':
            'https://media.istockphoto.com/id/456817655/photo/shoulder-press-workout.jpg?s=612x612&w=0&k=20&c=kNIXTB79eTj2gsACp_cycaFi2FjrMsJwYuAObaUz02Q=',
        'url': 'https://www.youtube.com/watch?v=qEwKCR5JCog'
      },
      {
        'name': 'Lat Pulldown',
        'description': 'Pull bar down to your chest.',
        'image':
            'https://media.istockphoto.com/id/1391577540/photo/shoulder-pull-down-machine-fitness-man-working-out-lat-pulldown-training-at-gym-upper-body.jpg?s=612x612&w=0&k=20&c=Lqp8eYw6rpCzW7iMf0nABvA0kDe5_2Z6Ljgy5Wa2KcM=',
        'url': 'https://www.youtube.com/watch?v=CAwf7n6Luuc'
      },
      {
        'name': 'Bicep Curls',
        'description': 'Curl dumbbells with biceps.',
        'image':
            'https://media.istockphoto.com/id/1486887865/photo/a-focused-sportsman-is-sitting-in-a-gym-and-doing-exercises-for-the-biceps-and-triceps-with-a.jpg?s=612x612&w=0&k=20&c=x9mDswt4N78flocXT0neJ0qSjt2BhMDs1LUwg4aVkaE=',
        'url': 'https://www.youtube.com/watch?v=ykJmrZ5v0Oo'
      },
      {
        'name': 'Leg Press',
        'description': 'Push platform using your legs.',
        'image':
            'https://media.istockphoto.com/id/597631958/photo/man-focused-on-training-legs-on-the-machine.jpg?s=612x612&w=0&k=20&c=_Xb9Jj_7qRt2iFeEEkKEoZgEa_xgN9gtAtsdl8GiToM=',
        'url': 'https://www.youtube.com/watch?v=IZxyjW7MPJQ'
      }
    ]
  };

  WorkoutDetailsScreen({super.key});

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("🏋️ Workout Categories"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.orangeAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1C1C1C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: workoutCategories.entries.map((category) {
            return ExpansionTile(
              backgroundColor: const Color(0xFF2C2C2C),
              collapsedBackgroundColor: const Color(0xFF2C2C2C),
              iconColor: Colors.orange,
              collapsedIconColor: Colors.white70,
              title: Text(
                category.key,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF6600),
                  fontFamily: 'Georgia',
                ),
              ),
              children: category.value.map((exercise) {
                return Card(
                  color: const Color(0xFF1E1E1E),
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        exercise['image']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () => _launchURL(exercise['url']!),
                      child: Text(
                        exercise['name']!,
                        style: const TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Georgia',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      exercise['description']!,
                      style: const TextStyle(
                          color: Colors.white70, fontFamily: 'Roboto'),
                    ),
                  ),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
