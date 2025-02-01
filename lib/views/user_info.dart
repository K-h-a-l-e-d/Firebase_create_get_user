import 'package:flutter/material.dart';
import 'package:user_info/models/user_model.dart';
import 'package:user_info/services/users_firebase_service.dart';
import 'package:user_info/views/user_input.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  getUsers() async {
    users = await UsersFirebaseService().getUsersFromFireBase();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Users Data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: users.isEmpty
            ? Center(
                child: Text('No User data Found'),
              )
            : Column(
                children: [
                  Text('Recently Saved User'),
                  savedData.isEmpty
                      ? Center(child: Text('No Users were added recently'))
                      : ListTile(
                          title: Text(savedData['name']),
                          subtitle: Text('Age: ${savedData['age']}'),
                          trailing: Text('Hobby: ${savedData['hobby']}'),
                        ),
                  Text('Users List'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(users[index].name ?? ''),
                          subtitle: Text(users[index].age != null
                              ? 'Age: ${users[index].age}'
                              : ''),
                          trailing: Text(
                            users[index].hobby != null
                                ? 'Hobby: ${users[index].hobby}'
                                : '',
                            style: TextStyle(fontSize: 12),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
