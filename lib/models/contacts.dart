import 'dart:io';

class Contacts {
  File image;
  String name;
  String number;
  String email;

  Contacts(this.image, this.number, this.name, this.email);

  static List<Contacts> contacts = [];

}
