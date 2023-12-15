import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:phone_list/person_model.dart';

class PersonService {
  Future<List<Person>> fetchPersons() async {
    String jsonString = await rootBundle.loadString("assets/phone_list.json");
    Map peopleData = jsonDecode(jsonString);

    final peoples = <Person>[];

    peopleData['result'].forEach((v) {
      peoples.add(Person.fromJson(v));
    });
    return peoples;
  }
}
