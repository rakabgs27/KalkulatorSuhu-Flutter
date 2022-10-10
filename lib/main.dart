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

  double celcius = 0;
  double kelvin = 0;
  double reamur = 0;

  konversiSuhu() {
    setState(() {
      celcius = double.parse(inputSuhu.text);
      reamur = 4 / 5 * celcius;
      kelvin = 273.15 + celcius;
    });
  }

  String dropdownvalue = 'Kelvin';  

  var items = [   
    'Kelvin',
    'Reamur',
    'Fahrenheit',
    'Celcius',
  ];


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
          children: [ 
            Expanded(
              child :
                Container(
                  child : 
                    Column(
                      children : [
                        inputUser(),
                        dropDown(),
                        outputSuhu(),
                        buttonKonversiSuhu(),
                      ],
                    ),
                ),
          ),
          ],
        ),
      )
      )
    );
  }

  dropDown() {
    return Container(
      child: DropdownButton(
          
        // Initial Value
        value: dropdownvalue,
          
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),   
          
        // Array list of items
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
      ),
    );
  }

  inputUser(){
    return TextFormField(
      controller: inputSuhu,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Masukan Suhu',
      ),
    );
  }

  outputSuhu(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(            
          children: [
            const Text('Suhu dalam Kelvin', 
            style: TextStyle(
              fontSize: 15
            ),),
            const SizedBox(height :20),
            Text("$kelvin", 
            style: const TextStyle(
              fontSize: 30
            ),
            )
          ],
        ),

        Column(
          children: [
            const Text('Suhu dalam Reamur', 
            style: TextStyle(
              fontSize: 15
            ),),
            const SizedBox(height :20),
            Text("$reamur", 
            style: const TextStyle(
              fontSize: 30
            ),
            )
          ],
        ),
      ],
    );
  }

  buttonKonversiSuhu(){
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Text('Konversi Suhu'),
        onPressed: () => konversiSuhu(),
      )
    );
  }
}