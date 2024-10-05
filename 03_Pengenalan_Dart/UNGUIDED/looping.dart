import 'dart:io';

void main() {
  // Meminta input jumlah baris
  stdout.write('Masukkan jumlah baris piramida: ');
  int baris = int.parse(stdin.readLineSync()!);

  // Loop luar untuk setiap baris
  for (int i = 1; i <= baris; i++) {
    // Mencetak spasi sebelum bintang
    for (int j = i; j < baris; j++) {
      stdout.write(' ');
    }

    // Mencetak bintang
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }

    // Pindah ke baris berikutnya
    print('');
  }
}
