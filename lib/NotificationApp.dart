import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new home();
  }
}

class home extends State<NotificationApp> {
  Future<Null> _newsatisfied() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text("rewind and remember"),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text("you never be satisfied ."),
                new Text('you\'re like me, iam never satisfied')
              ],
            ),
          ),
          actions: [
            new FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text(" No "))
          ],
        );
      },
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            padding: new EdgeInsets.all(22.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text("hello mohamed"),
                new FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: new Text(" closed ")),
              ],
            ),
          );
        });
  }

  String myValue = " Nour ";
  void setValue(String value) {
    setState(() {
      myValue = value;
    });
  }

  Future showSimpleDia() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text("simple dialoug"),
            children: [
              new SimpleDialogOption(
                  child: new Text(" yes "),
                  onPressed: () => Navigator.pop(context, setValue("Yes"))),
              new SimpleDialogOption(
                  child: new Text(" No "),
                  onPressed: () => Navigator.pop(context, setValue("No"))),
              new SimpleDialogOption(
                  child: new Text(" May Be "),
                  onPressed: () => Navigator.pop(context, setValue("May be"))),
            ],
          );
        });
  }

  final GlobalKey<ScaffoldState> scaffoldstate = new GlobalKey<ScaffoldState>();
  void showSnackBar() {
    scaffoldstate.currentState
        .showSnackBar(new SnackBar(content: new Text("hey nour /.;")));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldstate, // this needed for show snack Bar
      appBar: new AppBar(
        title: new Text("NotificationApp"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(33.0),
        child: new Center(
          child: new Card(
              child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                   new Text("$myValue"),
                   new FlatButton(
                    onPressed: _newsatisfied, child: new Text("Aleart dialoug")),
                   new FlatButton(
                      onPressed: showBottomSheet,
                     child: new Text(" bottom sheet ")),
                   new FlatButton(
                  onPressed: showSimpleDia,
                  child: new Text(" simple dialoug ")),
                  new RaisedButton(
                  onPressed: showSnackBar, child: new Text("snack Bar"))
            ],
          )
          ),
        ),
      ),
    );
  }
}
