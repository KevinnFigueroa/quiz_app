import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _nameController = TextEditingController();

class NameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
          fillColor: Colors.white,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Full Name'),
      onChanged: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }
}
