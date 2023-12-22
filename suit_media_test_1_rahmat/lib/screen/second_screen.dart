// a. It has a static “Welcome” text label/textview
// b. And it has two dynamic labels / textviews for the show name from the first screen and the other one is the Selected User Name label.
// c. It has a button “Choose a User”.
// d. Action click button “Choose a User” for goto third screen.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suit_media_test_1_rahmat/models/user.dart';
import 'package:suit_media_test_1_rahmat/screen/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.name});
  final String name;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  UserModel? _selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Color(0xFF554AF0),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 21),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            final res = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ThirdScreen();
                },
              ),
            );
            debugPrint('res: $res');
            if (res != null && res is UserModel) {
              setState(() {
                _selectedUser = res;
              });
            }
          },
          child: const Text('Choose a User'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 21, right: 21, top: 21, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome', style: Theme.of(context).textTheme.bodySmall),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            Center(child: buildSelectedUser()),
            const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget buildSelectedUser() {
    return _selectedUser == null
        ? Text(
            'Selected User Name',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
          )
        : Text(
            '${_selectedUser!.firstName} ${_selectedUser!.lastName}',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
          );
  }
}
