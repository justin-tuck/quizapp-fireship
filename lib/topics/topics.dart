import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/services/firestore.dart';
import 'package:quizapp/services/models.dart';
import 'package:quizapp/shared/bottom_nav.dart';
import 'package:quizapp/shared/error.dart';
import 'package:quizapp/shared/loading.dart';
import 'package:quizapp/topics/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //takes future pulling the topics from DB and then uses builder to build on the state of that ui
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          List<Topic> topics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
            ),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: topics
                  .map((topic) => TopicItem(
                        topic: topic,
                      ))
                  .toList(),
            ),
            bottomNavigationBar: const BottomNavBar(),
          );
        } else {
          // data payload could be empty here
          return const Text('No topics found in Firestore. Check database');
        }
      },
    );
  }
}
