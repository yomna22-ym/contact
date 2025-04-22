import 'package:contact_task/additional/colors_app.dart';
import 'package:contact_task/models/contacts.dart';
import 'package:flutter/material.dart';

class UserContacts extends StatelessWidget {
  Contacts contact;
  int index;
  Function onClickD;

  UserContacts({required this.contact, required this.index, required this.onClickD,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.gld,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            child: Image.file(
              contact.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: ColorApp.drkblu,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(child: Text(contact.email))
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: ColorApp.drkblu,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(child: Text(contact.number))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                FilledButton(
                    onPressed: () {
                      onClickD(index);
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Delete')
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
