import 'package:contact_task/additional/colors_app.dart';
import 'package:contact_task/additional/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MtList extends StatelessWidget {
  const MtList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(Images.mtylst),
            Text(
              'There Is No Contacts Added Here',
              style: TextStyle(
                  color: ColorApp.gld, fontWeight: FontWeight.w600, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
