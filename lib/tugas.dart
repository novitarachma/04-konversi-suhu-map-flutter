import 'package:flutter/material.dart';
import 'package:statefull_widget_dan_map/widgets/inputSuhu.dart';
import 'package:statefull_widget_dan_map/widgets/konversiSuhu.dart';
import 'package:statefull_widget_dan_map/widgets/perhitunganTerakhir.dart';
import 'package:statefull_widget_dan_map/widgets/riwayatPerhitungan.dart';
import 'package:statefull_widget_dan_map/widgets/targetPerhitungan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2031710062_RachmaNovitaAnggreani',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
          title: 'Konverter Suhu (2031710062_RachmaNovitaAnggreani)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Pilih suhu", "Kelvin", "Reamur"];
  String selectedDropDown = "Pilih suhu";
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  onDropdownChanged(String value) {
    setState(() {
      selectedDropDown = value;
    });
    konversiSuhu();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            inputSuhu(etInput: etInput),
            SizedBox(
              height: 8,
            ),
            targetPerhitungan(
              selectedDropDown: selectedDropDown,
              listSatuanSuhu: listSatuanSuhu,
              onDropDownChanged: onDropdownChanged,
            ),
            SizedBox(height: 10),
            Text(
              "Hasil",
              style: TextStyle(fontSize: 20),
            ),
            perhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
            SizedBox(height: 10),
            konversiSuhuu(
              onPressed: konversiSuhu,
            ),
            SizedBox(height: 10),
            Text(
              "Riwayat Konversi",
              style: TextStyle(fontSize: 20),
            ),
            riwayatPerhitungan(listHasil: listHasil),
          ],
        ),
      ),
    );
  }

  void konversiSuhu() {
    setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case "Kelvin":
            hasilPerhitungan = int.parse(etInput.text) + 273;
            break;
          case "Reamur":
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;
            break;
          default:
            listHasil.add("Suhu belum dipilih");
            break;
        }
      } else {
        listHasil.add("Suhu belum dimasukkan dan hasilnya kosong");
      }

      listHasil.add(selectedDropDown + " : " + hasilPerhitungan.toString());
    });
  }
}
