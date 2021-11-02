import 'package:flutter/material.dart';
import 'package:latihan_1/Models/tanaman.dart';
import 'package:latihan_1/Services/apiStatic.dart';
import 'package:latihan_1/UI/detailTanamanPage.dart';
import 'package:latihan_1/UI/widget/buttomBar.dart';

class TanamanPage extends StatefulWidget {
  @override
  _TanamanPageState createState() => _TanamanPageState();
}

class _TanamanPageState extends State<TanamanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daftar Tanaman'),
        ),
        body: FutureBuilder<List<Tanaman>>(
          future: ApiStatic.getTanaman(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              List<Tanaman> listTanaman = snapshot.data!;
              return Container(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: listTanaman.length,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DetailTanamanPage(
                                    tanaman: listTanaman[index],
                                  )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(top: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: Colors.lightGreenAccent)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(
                                ApiStatic.host + '/' + listTanaman[index].foto,
                                width: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Column(
                                  children: [
                                    Text(listTanaman[index].nama),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
        bottomNavigationBar: buildBottomBar(1, context));
  }
}
