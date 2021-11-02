import 'dart:convert';
import 'package:latihan_1/Models/tanaman.dart';
import 'package:http/http.dart' as http;

class ApiStatic {
  static final host = 'http://192.168.43.157/oplant/public/api';
  static final _token = "2|gefvY20yveV5fRL4HrrkUAFEgEXzjugwpzwTWXhw";
  static getHost() {
    return host;
  }

  // static Future<List<Tanaman>> getTanaman2() async {
  //   List<Tanaman> tanaman = [];
  //   for (var i = 0; i < 10; i++) {
  //     tanaman.add(Tanaman(
  //         idPlant: i,
  //         kdPlant: "001",
  //         nama: "Anggrek" + i.toString(),
  //         harga: "Rp. 50000",
  //         deskripsi: "Anggrek adalah tanaman hias",
  //         foto:
  //             "data:image/jpeg;base64,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",
  //         idKelompok: 1,
  //         createdAt: "",
  //         updatedAt: ""));
  //   }
  //   return tanaman;
  // }

  static Future<List<Tanaman>> getTanaman() async {
    // String response =
    //     '{"current_page":1,"data":[{"id_plant":1,"kd_plant":"001","nama_plant":"Bunga Dandelion","harga":"500000","deskripsi":"Bunga dandelion adalah bunga yang cantik dan menawan","foto":"uploads\/plants\/163552349633jh0z.png","id_kelompok_plant":1,"created_at":null,"updated_at":null,"nama_kelompok":"Tanaman Hias"},{"id_plant":7,"kd_plant":"002","nama_plant":"Bunga Mawar","harga":"50000","deskripsi":"Bunga mawar adalah","foto":"uploads\/plants\/163552882713d52f82c8314a982e0e45be60452193.jpg","id_kelompok_plant":1,"created_at":null,"updated_at":null,"nama_kelompok":"Tanaman Hias"}],"first_page_url":"http:\/\/127.0.0.1:8000\/api\/plant?page=1","from":1,"last_page":1,"last_page_url":"http:\/\/127.0.0.1:8000\/api\/plant?page=1","links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http:\/\/127.0.0.1:8000\/api\/plant?page=1","label":"1","active":true},{"url":null,"label":"Next &raquo;","active":false}],"next_page_url":null,"path":"http:\/\/127.0.0.1:8000\/api\/plant","per_page":5,"prev_page_url":null,"to":2,"total":2}';
    try {
      final response = await http.get(
          Uri.parse('http://192.168.43.157/oplant/public/api/plant'),
          headers: {
            'Authorization': 'Bearer' + _token,
          });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Tanaman>((json) => Tanaman.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
