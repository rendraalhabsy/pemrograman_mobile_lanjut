// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:phone_list/person_model.dart';
import 'package:phone_list/person_service.dart';

class HomeScreen extends StatelessWidget {
  final PersonService personService = PersonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak Telepon'),
      ),
      body: Container(
        child: SafeArea(
          child: FutureBuilder(
            future: personService.fetchPersons(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Card(
                          child: ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                var currentPerson = snapshot.data?[index];

                                return ListTile(
                                  title: Text(currentPerson!.name),
                                  subtitle: Text(
                                      "Phone: ${currentPerson.phoneNumber}"),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                return Center(
                    child: Icon(
                  Icons.error,
                  color: const Color.fromARGB(255, 54, 57, 244),
                  size: 82.0,
                ));
              }
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Loading at the moment, please hold the line.")
                ],
              ));
            },
          ),
        ),
      ),
    );
  }
}
