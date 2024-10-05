import 'dart:io';

void main() {
  print('Masukkan bilangan bulat:');
  int? bilangan = int.parse(stdin.readLineSync()!); // Meminta input bilangan

  if (cekPrima(bilangan)) {
    print('$bilangan adalah bilangan prima');
  } else {
    print('$bilangan bukan bilangan prima');
  }
}

bool cekPrima(int bilangan) {
  if (bilangan <= 1) {
    return false; // Bilangan kurang dari atau sama dengan 1 bukan bilangan prima
  }

  for (int i = 2; i <= bilangan ~/ 2; i++) {
    if (bilangan % i == 0) {
      return false; // Jika ada pembagi selain 1 dan bilangan itu sendiri, bukan prima
    }
  }

  return true; // Bilangan prima
}
