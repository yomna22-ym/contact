import 'package:contact_task/additional/colors_app.dart';
import 'package:flutter/material.dart';

typedef TextFieldCallback = String? Function(String val);

class TextFiield extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String title;
  TextFieldCallback validator;
  TextInputType textInputType;

  final FocusNode _foucsNode = FocusNode();

  TextFiield(
      {required this.controller,
      required this.validator,
      required this.title,
      required this.textInputType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) => validator(val!),
          style: TextStyle(fontSize: 16, color: ColorApp.gld),
          keyboardType: textInputType,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorApp.gld),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorApp.gld),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorApp.gld),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorApp.gld),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: title,
              hintStyle: TextStyle(fontSize: 16, color: ColorApp.litblu)),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
