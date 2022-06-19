// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, deprecated_member_use, unused_import, unused_local_variable, prefer_const_declarations, unused_field, unnecessary_new, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pazig_project/welcome_page.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final notesName = 'Your notes';
  final notesController = TextEditingController();

  late DatabaseReference _notesRef;

  @override
  void initState() {
    /*final FirebaseDatabase database = FirebaseDatabase (app: widget.app);
      _notesRef = database.reference().child('Notes');*/

    _notesRef = FirebaseDatabase.instance.reference().child('Notes');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text('It is place for your notes!'),
          backgroundColor: Color(0xFF758FDB)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Text(notesName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    TextField(
                      controller: notesController,
                      textAlign: TextAlign.center,
                    ),
                    FlatButton(
                      color: Color(0xFF758FDB),
                      onPressed: () {
                        _notesRef
                            .push()
                            .child(notesName)
                            .set(notesController.text)
                            .asStream();
                        notesController.clear();
                      },
                      child: Text('Save notes'),
                      textColor: Colors.white,
                    ),
                    Flexible(
                        child: new FirebaseAnimatedList(
                            shrinkWrap: true,
                            query: _notesRef,
                            itemBuilder: (BuildContext contex,
                                DataSnapshot snapshot,
                                Animation<double> animation,
                                int index) {
                              return new ListTile(
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () =>
                                      _notesRef.child(snapshot.key!).remove(),
                                ),
                                //title: new Text(snapshot.value!['Your notes'],)
                              );
                            }))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
