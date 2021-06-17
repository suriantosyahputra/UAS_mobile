import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    routes: {
      'hal1': (BuildContext context) => Nita(),
    },
  ));
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Data Diri'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.calculate),
              tooltip: 'Fungsi IF dan Aritmatika',
              onPressed: () {
                Navigator.of(context).pushNamed("hal1");
              }),
        ],
      ),
      body: 
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text("NAMA MAHASISWA")),
            DataColumn(label: Text("NIRM")),
            DataColumn(label: Text("KELAS")),
            DataColumn(label: Text("ALAMAT"))
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text("surianto syah putra")),
                DataCell(Text("2018020465")),
                DataCell(Text("6 SIA 4")),
                DataCell(Text("Jl. Luku 1 Gg bersama")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Nita extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fungsi IF dan Aritmatika Menentukan Diskon'),
      ),
      body: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final txtnama = TextEditingController();
  final txtjumlah = TextEditingController();
  final txtharga = TextEditingController();

  String nama = '';
  String total = '';
  String bayar = '';

  onHitung() {
    setState(() {
      nama = (txtnama.text);
      var jumlah = int.parse(txtjumlah.text);
      total = " $jumlah Porsi";
      var harga = jumlah * int.parse(txtharga.text);
      if (jumlah > 3) {
        nama = (txtnama.text);
        var diskon = harga - 1000;
        bayar = "Rp. $diskon";
      } else {
        bayar = "Rp. $harga";
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: <Widget>[
          TextField(
            controller: txtnama,
            decoration: new InputDecoration(
              labelText: "Nama Makanan",
            ),
          ),
          TextField(
            controller: txtjumlah,
            decoration: new InputDecoration(
              labelText: "Jumlah Porsi",
            ),
          ),
          TextField(
            controller: txtharga,
            decoration: new InputDecoration(
              labelText: "Harga per Porsi",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.only(top: 32),
              decoration: BoxDecoration(
                  color: Color(0XFF2a3ed7),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: FlatButton(
                onPressed: onHitung,
                child: Text('Hitung'),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text("NAMA MAKANAN")),
                DataColumn(label: Text("JUMLAH MAKANAN")),
                DataColumn(label: Text("TOTAL BAYAR")),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(nama)),
                    DataCell(Text(total)),
                    DataCell(Text(bayar)),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
