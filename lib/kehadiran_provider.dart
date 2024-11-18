import 'package:flutter/material.dart';

class KehadiranProvider with ChangeNotifier {
  // Daftar mahasiswa default
  List<Map<String, dynamic>> mahasiswas = [
    {'name': 'Ali', 'isPresent': false},
    {'name': 'Budi', 'isPresent': false},
    {'name': 'Citra', 'isPresent': false},
  ];

  // Riwayat kehadiran
  List<Map<String, dynamic>> historyKehadiran = [];

  // Simpan kehadiran siswa
  void saveKehadiran() {
    final jumlahKehadiran = mahasiswas.where((mhs) => mhs['isPresent']).length;
    final jumlahTidakHadir = mahasiswas.length - jumlahKehadiran;

    historyKehadiran.insert(0, {
      'tanggal': DateTime.now(),
      'hadir': jumlahKehadiran,
      'tidak hadir': jumlahTidakHadir,
    });

    // Reset kehadiran siswa
    for (var mahasiswa in mahasiswas) {
      mahasiswa['isPresent'] = false;
    }

    notifyListeners();
  }

  // Update status kehadiran siswa
  void toggleKehadiran(int index, bool value) {
    mahasiswas[index]['isPresent'] = value;
    notifyListeners();
  }
}
