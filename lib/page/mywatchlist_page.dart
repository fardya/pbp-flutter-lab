import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/watchlistdetail.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/fetch/mywatchlist_fetch.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(MyWatchList myWatchList) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            child: const Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            myWatchList.title,
          ),
          trailing: Checkbox(
            value: myWatchList.watched,
            onChanged: (bool? newValue) {
              setState(() {
                myWatchList.watched = !myWatchList.watched;
              });
            },
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWatchListDetailPage(myWatchList: myWatchList)));
          },
        );

    Card makeCard(MyWatchList myWatchList) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
          elevation: 4,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: myWatchList.watched
                  ? Colors.lightGreenAccent.shade400
                  : Colors.pinkAccent.shade400,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            child: makeListTile(myWatchList),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: const DrawerBar(),
      body: FutureBuilder(
          future: fetchMyWatchList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      'Tidak ada watch list :(',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => makeCard(snapshot.data![index]));
              }
            }
          }),
    );
  }
}