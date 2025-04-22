import 'dart:io';

import 'package:contact_task/additional/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:contact_task/additional/images.dart';

class PersonCard extends StatefulWidget {
  final TextEditingController nameController;

  final TextEditingController emailController;

  final TextEditingController phoneController;

  File? image;

  Function onClick;

  PersonCard(
      {required this.phoneController,
      required this.emailController,
      required this.nameController,
      this.image,
      required this.onClick,
      super.key});

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              await widget.onClick();
              setState(() {});
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 2, color: ColorApp.gld)),
                  child: widget.image == null
                      ? Lottie.asset(Images.mgpkr)
                      : Image.file(
                          widget.image!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder(
                  valueListenable: widget.nameController,
                  builder: (context, value, child) => Text(
                    value.text.isEmpty ? 'User Name' : value.text,
                    style: TextStyle(fontSize: 18, color: ColorApp.gld),
                  ),
                ),
                Divider(
                  color: ColorApp.gld,
                ),
                ValueListenableBuilder(
                  valueListenable: widget.emailController,
                  builder: (context, value, child) => Text(
                    value.text.isEmpty ? 'User@email.com' : value.text,
                    style: TextStyle(fontSize: 16, color: ColorApp.gld),
                  ),
                ),
                Divider(
                  color: ColorApp.gld,
                ),
                ValueListenableBuilder(
                  valueListenable: widget.phoneController,
                  builder: (context, value, child) => Text(
                    value.text.isEmpty ? '+201000000000' : value.text,
                    style: TextStyle(fontSize: 16, color: ColorApp.gld),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
