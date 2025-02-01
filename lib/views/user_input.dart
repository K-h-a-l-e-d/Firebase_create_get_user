import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_info/views/user_info.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key, required this.title});

  final String title;

  @override
  State<UserInput> createState() => _UserInputState();
}

var savedData = {};

class _UserInputState extends State<UserInput> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 20,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                label: Text('Name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                filled: true,
                label: Text('Age'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            TextFormField(
              controller: hobbyController,
              decoration: InputDecoration(
                filled: true,
                label: Text('Hobby'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            FilledButton(
              onPressed: () {
                var db = FirebaseFirestore.instance;

                final data = {
                  "name": nameController.text,
                  "age": ageController.text,
                  "hobby": hobbyController.text
                };
                db.collection("users").add(data).then((documentSnapshot) {
                  nameController.clear();
                  ageController.clear();
                  hobbyController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Added User data with ID: ${documentSnapshot.id}")));
                });

                savedData = data;
              },
              child: Text('Save Data'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserData(),
                    ));
              },
              child: Text('Display Saved Data'),
            ),
          ],
        ),
      ),
    );
  }
}
