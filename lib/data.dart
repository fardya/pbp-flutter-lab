import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/drawer.dart';

class MyDataPage extends StatefulWidget {
    const MyDataPage({super.key});

    @override
    State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: Text('Data Budget'),
            ),
            drawer: const DrawerBar(),

            body: Center(
                    child: ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: ((context, index) {
                        return Padding(
                        padding: const EdgeInsets.all(7),
                        child: Material(
                            borderRadius: BorderRadius.circular(7),
                            shadowColor: Colors.grey,
                            elevation: 3,
                            child: Column(
                                children: [
                                    // menampilkan judul
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        alignment: Alignment.topLeft,
                                        child: Text(dataList[index].judul, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                                    ),
                                    
                                    // menampilkan nominal, jenis, tanggal
                                    Container(
                                        padding: EdgeInsets.all(8),
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Text(dataList[index].nominal.toString()),
                                                Text(dataList[index].jenis),
                                                Text(
                                                    dataList[index].tanggal.toString().substring(0, 10), 
                                                    style: const TextStyle(color: Colors.grey),
                                                ),
                                            ],
                                        ),
                                    ),
                                ], 
                            ),
                        ),
                        );
                    }),
                )
            ),
        );
    }
}