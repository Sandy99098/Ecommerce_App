import 'package:ecommerce_app/pages/profile_edit.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        actions: [
          IconButton(
              onPressed: () {
                // ProfileEdit() redirect to the profile edit page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileEdit()),
                );
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      //######################
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              //////
              ///
              const SizedBox(
                height: 10,
              ),
              Text("Hency", style: TextTheme.of(context).bodyLarge),
              const SizedBox(
                height: 10,
              ),
              Text("hency@gmail.com"),
              const SizedBox(
                height: 10,
              ),
              Text("9899999999"),
            ],
          ),
        ),
      ),
    );
  }
}
