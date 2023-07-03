import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(),
    );
  }
}

class Contact {


  final String name;
  final String email;
  final String phoneNumber;


  Contact({

    required this.name,
    required this.email,
    required this.phoneNumber,

  });
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'Walid Dipto',
      email: 'wdipto@gmail.com',
      phoneNumber: '01687975175',
    ),
    Contact(
      name: 'singh',
      email: 'singh@gmail.com',
      phoneNumber: '0259845333',
    ),
    Contact(
      name: 'Sagor',
      email: 'sagor@gmail.com',
      phoneNumber: '01611898960',
    ),
  ];

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Text("Contact Details", style: TextStyle(fontWeight: FontWeight.bold) ),
              SizedBox(height: 35),

              Text('Email: ${contact.name}'),
              SizedBox(height: 10),
              Text('Email: ${contact.email}'),
              SizedBox(height: 10),
              Text('Phone: ${contact.phoneNumber}'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.email),
            onTap: () => _showContactDetails(context, contact),
          );
        },
      ),
    );
  }
}
