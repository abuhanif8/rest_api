import 'package:flutter/material.dart';

import 'helper.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List? notes;
  bool isLoaded = false;

  getData() async {
    notes = await NoteHelper().getNotes();
    setState(() {
      isLoaded = false;
      
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: notes?.length ?? 0,
          itemBuilder: (_, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(notes![index].id.toString()),
                ),
                title: Text(notes![index].title),
                subtitle: Text(notes![index].description),
              ),
            );
          }),
    );
  }
}
