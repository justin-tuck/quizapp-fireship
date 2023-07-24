import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/services/models.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    User user = AuthService().user!;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.displayName ?? 'Guest'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.photoURL ??
                      'https://www.gravatar.com/avatar/placeholder'),
                ),
              ),
            ),
            Text(user.email ?? '',
                style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            Text(
              '${report.total}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'Quizzes Completed',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            ElevatedButton(
              child: const Text('sign out'),
              onPressed: () async {
                await AuthService().signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
