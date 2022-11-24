import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/drawer.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class BudgetData {
    late String judul;
    late int nominal;
    late String jenis;
    late DateTime tanggal;

    BudgetData (
        {required this.judul, required this.nominal, required this.jenis, required this.tanggal}
    );
}

List<BudgetData> dataList = [];

class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _judul = "";
    int nominal = 0;
    List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
    String? _jenis;
    DateTime tanggal = DateTime.now();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Tambah Budget'),
            ),
            drawer: const DrawerBar(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            children: [
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'Judul',
                                            labelText: 'Judul',
                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                            ),
                                            onChanged: (String? value) {
                                                setState(() {
                                                    _judul = value!;
                                                });
                                            },
                                            onSaved: (String? value) {
                                                setState(() {
                                                    _judul = value!;
                                                });
                                            },
                                            validator: (String? value) {
                                                if (value==null || value.isEmpty) {
                                                    return 'Judul budget tidak boleh kosong';
                                                } 
                                                return null;
                                        },
                                    ),
                                ),
                                
                                Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                                hintText: 'Nominal',
                                                labelText: 'Nominal',
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                            ),
                                            onChanged: (String? value) {
                                                setState(() {
                                                    nominal = int.parse(value!);
                                                });
                                            },
                                            onSaved: (String? value) {
                                                setState(() {
                                                    nominal = int.parse(value!);
                                                });
                                            },
                                            validator: (String? value) {
                                                if (value==null || value.isEmpty) {
                                                    return 'Nominal budget tidak boleh kosong';
                                                }
                                                return null;
                                            },
                                    ),
                                ),

                                ListTile(
                                    title: Text("${tanggal.day}/${tanggal.month}/${tanggal.year}"),
                                    leading: TextButton.icon(
                                        label: const Text('Tanggal'),
                                        icon: const Icon(Icons.calendar_month_outlined),
                                        onPressed: () {
                                        showDatePicker(
                                            context: context, 
                                            initialDate: DateTime.now(), 
                                            firstDate: DateTime(2021), 
                                            lastDate: DateTime(2100)
                                        ).then((tanggal) {
                                            setState(() {
                                            tanggal = tanggal!;
                                            });
                                        });
                                        },
                                    ),
                                ),

                                // dropdown memilih jenis budget
                                DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        items: listJenis.map((String jenisItem) {
                                        return DropdownMenuItem(
                                            value: jenisItem,
                                            child: Text(jenisItem),
                                        );
                                        }).toList(),
                                        hint: const SizedBox(
                                        width: 150,
                                        child: Text(
                                            "Pilih Jenis",
                                            style: TextStyle(color: Colors.grey),
                                            textAlign: TextAlign.center,
                                        ),
                                        ),
                                        onChanged: (String? newValue) {
                                        setState(() {
                                            _jenis = newValue!;
                                        });
                                        },
                                        value: _jenis,
                                        icon: const Icon(Icons.arrow_drop_down),
                                    )
                                ),

                                // tombol simpan dan pop up data setelah ditambah
                                Container(
                                    padding: const EdgeInsets.only(top: 30),
                                    alignment: Alignment.bottomCenter,
                                    child: TextButton(
                                    child: const Text(
                                        'Simpan',
                                        style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                                    ),
                                        onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                            if (_jenis == null || _jenis == '') {
                                            showDialog(
                                                context: context, 
                                                builder: (context) {
                                                return Dialog(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                                                    elevation: 10,
                                                    child: ListView(
                                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                                    shrinkWrap: true,
                                                    children: <Widget>[
                                                        const Center(child: Text('Jenis'),),
                                                        const SizedBox(height: 25,),
                                                        TextButton(
                                                        onPressed: () {
                                                            Navigator.pop(context);
                                                        }, 
                                                        child: const Text('Kembali'),
                                                        ),
                                                    ],
                                                ),
                                            );
                                            },
                                        );
                                        }
                                        else {
                                            onPressed(context);
                                        }
                                    }   
                                },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onPressed(BuildContext context) {
    var data = BudgetData(judul: _judul!, nominal: nominal!, jenis: _jenis!, tanggal: tanggal);
    dataList.add(data);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyDataPage()),
    );
  }
}