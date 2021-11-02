import 'package:flutter/material.dart';
import 'package:latihan_1/Models/tanaman.dart';

class DetailTanamanPage extends StatefulWidget {
  DetailTanamanPage({required this.tanaman});
  final Tanaman tanaman;
  @override
  _DetailTanamanPageState createState() => _DetailTanamanPageState();
}

class _DetailTanamanPageState extends State<DetailTanamanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tanaman.nama),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Image.network(widget.tanaman.foto),
            Container(
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff1364bd), const Color(0xff295Cb5)],
                ),
              ),
              child: Text(
                widget.tanaman.harga,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.lightBlue,
              width: double.infinity,
              height: double.maxFinite,
              child: new Text(widget.tanaman.deskripsi),
            ),
          ],
        ),
      ),
    );
  }
}
