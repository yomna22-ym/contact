import 'package:contact_task/additional/colors_app.dart';
import 'package:contact_task/models/contacts.dart';
import 'package:contact_task/screens/taps/mt_list.dart';
import 'package:contact_task/screens/taps/user_contacts.dart';
import 'package:flutter/material.dart';
import 'package:contact_task/additional/images.dart';
import 'package:contact_task/screens/taps/bottom_sheet_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.drkblu,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(
              Images.rt,
              height: MediaQuery.of(context).size.height * 0.06,
            ),
          ),
          Contacts.contacts.isEmpty
              ? MtList()
              : Expanded(
                  child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => UserContacts(
                      contact: Contacts.contacts[index],
                      index: index,
                      onClickD: (index) {
                        Contacts.contacts.removeAt(index);
                        setState(() {});
                      }),
                  itemCount: Contacts.contacts.length,
                )),
        ],
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: Contacts.contacts.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                Contacts.contacts.removeAt(Contacts.contacts.length - 1);
                setState(() {});
              },
              backgroundColor: ColorApp.gld,
              foregroundColor: Colors.redAccent,
              child: Icon(Icons.delete),
            ),
          ),
          SizedBox(height: 8,),
          Visibility(
            visible: Contacts.contacts.length <= 4,
            child: FloatingActionButton(
              onPressed: () {
                _showModalButtonSheet();
              },
              backgroundColor: ColorApp.gld,
              foregroundColor: ColorApp.drkblu,
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  void _showModalButtonSheet() async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(40))),
      backgroundColor: ColorApp.drkblu,
      isScrollControlled: true,
      builder: (context) => BottomSheetTap(),
    );
    setState(() {});
  }
}
