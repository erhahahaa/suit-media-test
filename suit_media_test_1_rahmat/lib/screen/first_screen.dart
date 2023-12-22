//  First Screen
// a. It has two inputTexts and two buttons.
// b. One inputText for name input and the other for input sentence text, to check whether the sentence is palindrome or not.
// Example :
// e.g isPalindrome(“kasur rusak”) -> true
// e.g isPalindrome(“step on no pets”) -> true
// e.g isPalindrome(“put it up”) -> true
// e.g isPalindrome(“suitmedia”) -> false
// c. A button with a “Check” title below the inputTexts
// d. Show as dialog with message “isPalindrome” if it’s palindrome and message “not   palindrome” if it’s not palindrome when clicking the button check
// e. And a button with a “Next” title below the Check Button.
// f. Go to the Second Screen when clicking the Next button.

import 'package:flutter/material.dart';
import 'package:suit_media_test_1_rahmat/screen/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late TextEditingController _nameController;
  late TextEditingController _palindromeeController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _palindromeeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeeController.dispose();
    super.dispose();
  }

  bool isPalindrome(String str) {
    String cleanStr = str.replaceAll(" ", "");
    cleanStr = cleanStr.toLowerCase();
    return cleanStr == cleanStr.split('').reversed.join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ic_photo.png',
              ),
              const SizedBox(
                height: 58,
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              TextField(
                controller: _palindromeeController,
                decoration: const InputDecoration(
                  hintText: 'Palindrome',
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            isPalindrome(_palindromeeController.text)
                                ? 'isPalindrome'
                                : 'not palindrome',
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('CHECK'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _nameController.text.isEmpty
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please input your name'),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondScreen(
                                name: _nameController.text,
                              ),
                            ),
                          );
                  },
                  child: const Text('NEXT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
