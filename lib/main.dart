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
  double hasil = 0;

  konversiSuhu() {
    setState(() {
      if (dropdownvalue == 'Kelvin') {
        celcius = double.parse(inputSuhu.text);
        kelvin = 273.15 + celcius;
        hasil = kelvin;
      }else if(dropdownvalue == 'Reamur'){
        celcius = double.parse(inputSuhu.text);
        reamur = 4 / 5 * celcius;
        hasil = reamur;
      }else if(dropdownvalue == 'Celcius'){
        celcius = double.parse(inputSuhu.text);
        hasil = celcius;
      }

      history.add("$dropdownvalue: $hasil");
    });
  }

  String dropdownvalue = 'Kelvin';  

  var items = [   
    'Kelvin',
    'Reamur',
    'Celcius',
  ];

  List<String> history = <String>[];


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Kalkulator Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
      resizeToAvoidBottomInset : false,
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
                        const SizedBox(height :20),
                        outputSuhu(),
                        buttonKonversiSuhu(),
                      ],
                    ),
                ),
          ),
            Expanded(
              child: 
                Container(
                  child: 
                    riwayatKonversi(history: history),
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
            const Text('Hasil', 
            style: TextStyle(
              fontSize: 20
            ),),
            const SizedBox(height :20),
            Text("$hasil", 
            style: const TextStyle(
              fontSize: 30
            ),
            ),
            const SizedBox(height :20),
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

class riwayatKonversi extends StatelessWidget {
  const riwayatKonversi({
    Key? key,
    required this.history,
  }) : super(key: key);

  final List<String> history;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
       const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Riwayat Konversi',
            style: TextStyle(fontSize: 18),
          ),
        ),
         Expanded(
          child: ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(history[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}