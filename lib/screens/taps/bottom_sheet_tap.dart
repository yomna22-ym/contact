import 'dart:io';

import 'package:contact_task/additional/colors_app.dart';
import 'package:contact_task/models/contacts.dart';
import 'package:contact_task/screens/taps/person_card.dart';
import 'package:contact_task/screens/taps/text_fiield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetTap extends StatefulWidget {
  const BottomSheetTap({super.key});

  @override
  State<BottomSheetTap> createState() => _BottomSheetTapState();
}

class _BottomSheetTapState extends State<BottomSheetTap> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  File? image;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Container(
        margin: EdgeInsets.all(16),
        padding: MediaQuery.of(context).viewInsets,
        child: Wrap(
          children: [
            PersonCard(
                phoneController: phoneController,
                emailController: emailController,
                nameController: nameController,
                image: image,
                onClick: () async {
                  ImagePicker imagePicker = ImagePicker();
                  var file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  if (file != null) {
                    image = File(file.path);
                    setState(() {});
                  }
                }),
            TextFiield(
              controller: nameController,
              title: 'Enter Your Name',
              textInputType: TextInputType.name,
              validator: (val) => val.isEmpty ? 'Enter Your Name' : null,
            ),
            TextFiield(
              controller: emailController,
              title: 'Enter Your Email',
              textInputType: TextInputType.emailAddress,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Enter Your Email';
                } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
                        r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?)*$")
                    .hasMatch(val)) {
                  return 'Enter Valid Email';
                }
                return null;
              },
            ),
            TextFiield(
              controller: phoneController,
              title: 'Enter Your Phone',
              textInputType: TextInputType.phone,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Enter Your Phone';
                } else if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(val)) {
                  return 'Enter Valid Phone';
                }
                return null;
              },
            ),
            FilledButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    if (image == null) {
                      return;
                    }
                    Contacts.contacts.add(Contacts(image!, phoneController.text,
                        nameController.text, emailController.text));
                    Navigator.pop(context);
                  }
                },
                style: FilledButton.styleFrom(
                    backgroundColor: ColorApp.gld,
                    foregroundColor: ColorApp.drkblu,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Enter User'),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
