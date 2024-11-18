import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../kehadiran_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final kehadiranProvider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text(
        'Absensi Mahasiswa',
        
      )),
      body: ListView.builder(
        itemCount: kehadiranProvider.mahasiswas.length,
        itemBuilder: (context, index) {
          final mahasiswa = kehadiranProvider.mahasiswas[index];
          return ListTile(
            title: Text(mahasiswa['name']),
            trailing: Checkbox(
              value: mahasiswa['isPresent'],
              onChanged: (value) {
                kehadiranProvider.toggleKehadiran(index, value!);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: kehadiranProvider.mahasiswas.any((mhs) => mhs['isPresent'])
              ? () {
                  kehadiranProvider.saveKehadiran();
                }
              : null,
          child: const Text('Simpan Kehadiran'),
        ),
      ),
    );
  }
}
