import 'package:flutter/material.dart';
import 'package:flutter_shared_perferences_vijay/second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  @override
  _SharedPreferenceState createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final String key1 = 'text1';
  final String key2 = 'text2';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _controller1.text = prefs.getString(key1) ?? '';
      _controller2.text = prefs.getString(key2) ?? '';
    });
  }

  _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key1, _controller1.text);
    prefs.setString(key2, _controller2.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller1,
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(labelText: 'Enter Mobile Number'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed:() {
                setState(() {
                  print('______saved');
                  print('-----------------> BankName:${_controller1.text}');
                  print('-----------------> BranchName:${_controller2   .text}');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondScreen()));
                  _saveData();
                });
              },
              
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

}

