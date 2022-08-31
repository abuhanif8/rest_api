import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/model.dart';

class NoteHelper {
  Future getNotes() async {
    var response = await http.get(
        Uri.parse('https://restapi.mahmudulhasanproject.xyz/api/all-notes'));
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body)['notes'];
      List<Note> notes = [];
      for (var noteData in responseData) {
        final Note note = Note.fromJson(noteData);
        notes.add(note);
      }
      return notes;
    }
  }
}
