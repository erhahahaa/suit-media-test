// a. It has a List / Table view of Users
// b. Collect data from api from regres.in with email, first_name, last_name & avatar
// c. Add a pull to refresh and load the next page when scrolling to the bottom of the list, and prepare an empty state if data is empty. You can use the API with adding parameter page & per_page to get next page data.
// d. When a User on an item list is clicked, the Selected User Name label in “Second Screen” will be replaced by the selected User’s name (don’t create a new screen, just continue the current screen).

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suit_media_test_1_rahmat/models/user.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int _page = 1;
  final int _perPage = 10;
  List<UserModel> _users = [];

  void _fetchData(BuildContext context) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Loading Data with page $_page'),
        ),
      );
      http
          .get(Uri.parse(
              'https://reqres.in/api/users?page=$_page&per_page=$_perPage'))
          .then((response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final List<UserModel> users = [];
          for (Map<String, dynamic> user in data['data']) {
            users.add(UserModel.fromJson(user));
          }
          setState(() {
            _users.isEmpty ? _users = users : _users.addAll(users);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Success Load Data with ${users.length} items'),
              ),
            );
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${response.statusCode}'),
            ),
          );
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 500), () {
      _fetchData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        _page++;
        _fetchData(context);
        return Future.value();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Third Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final UserModel user = _users[index];
              return ListTile(
                onTap: () {
                  Navigator.pop(context, user);
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text(
                  "${user.firstName} ${user.lastName}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  user.email,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
