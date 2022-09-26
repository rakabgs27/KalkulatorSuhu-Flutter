import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController inputSuhu = TextEditingController();



  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Kalkulator Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Suhu'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            inputUser(),
            Text("Test Output"),
            Text("Test Submit"),
          ],
        ),
      )
      )
    );
  }

  inputUser(){
    return TextFormField(
      controller: inputSuhu,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Masukan Suhu Dalam Celcius',
      ),
    );
  }
}