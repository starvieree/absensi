import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../kehadiran_provider.dart';
import 'package:intl/intl.dart';

class RiwayatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kehadiranProvider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Kehadiran')),
      body: kehadiranProvider.historyKehadiran.isEmpty
          ? const Center(
            child: Text(
              'Silahkan isi presensi mahasiswa terlebih dahulu',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey
              ),
            ),
          )
          : ListView.builder(
              itemCount: kehadiranProvider.historyKehadiran.length,
              itemBuilder: (context, index) {
                final history = kehadiranProvider.historyKehadiran[index];
                final formatTanggal =
                    DateFormat('dd MMM yyyy').format(history['tanggal']);
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Hadir: ${history['hadir']}, Tidak Hadir: ${history['tidak hadir']}'),
                      Text(formatTanggal),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nama mahasiswa yang hadir: ${history['namaHadir']}'
                      ),
                      Text(
                        'Nama mahasiswa yang tidak hadir: ${history['namaTidakHadir']}'
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
