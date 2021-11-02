import 'dart:convert';

class Tanaman {
  Tanaman({
    required this.idPlant,
    required this.kdPlant,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.foto,
    required this.idKelompok,
    required this.createdAt,
    required this.updatedAt,
  });
  int idPlant;
  String kdPlant;
  String nama;
  String harga;
  String deskripsi;
  String foto;
  int idKelompok;
  String createdAt;
  String updatedAt;

  factory Tanaman.fromJson(Map<String, dynamic> json) => Tanaman(
        idPlant: json["id_plant"],
        kdPlant: json["kd_plant"].toString(),
        nama: json["nama_plant"].toString(),
        harga: json["harga"].toString(),
        deskripsi: json["deskripsi"].toString(),
        foto: json["foto"].toString(),
        idKelompok: json["id_kelompok_plant"],
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );
}
