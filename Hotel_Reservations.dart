//Nama: S**** G***** A****
//NIM : ****
//Tema: #6 Sistem Reservasi Hotel 

//======================================================
//1.SUPERCLASS
//======================================================
class KamarHotel {
  //Encapsulation: Menyembunyikan atribut menggunakan underscore
  String _kodeKamar;
  double _tarifMalam;

  //Constructor
  KamarHotel(this._kodeKamar, this._tarifMalam);

  //Getter: Akses baca utk variabel private
  String get kodeKamar => _kodeKamar;
  double get tarifMalam => _tarifMalam;

  //Setter: Akses tulis dgn logika validasi
  set tarifMalam(double tarifBaru) {
    if (tarifBaru <= 0) {
      print("[Sistem] GAGAL: Tarif tidak bisa kurang dari atau sama dengan nol!");
    } else {
      _tarifMalam = tarifBaru;
      print("[Sistem] SUKSES: Tarif kamar $_kodeKamar diperbarui menjadi Rp$_tarifMalam");
    }
  }

  //Method dasar untuk polymorphism
  void cetakDetail() {
    print("Ruangan: $_kodeKamar | Tarif Dasar: Rp$_tarifMalam");
  }
}

//======================================================
//2. CLASS ANAK (INHERITANCE)
//======================================================

//Subclass 1
class KamarReguler extends KamarHotel {
  bool fasilitasEkstraBed; 

  KamarReguler(String kodeKamar, double tarifMalam, this.fasilitasEkstraBed)
      : super(kodeKamar, tarifMalam);

  //Polymorphism (Method Overriding)
  @override
  void cetakDetail() {
    String statusBed = fasilitasEkstraBed ? "Plus Ekstra Bed" : "Tanpa Ekstra Bed";
    print("🛏️ TIPE REGULER | No: $kodeKamar | Info: $statusBed | Tarif: Rp$tarifMalam");
  }
}

// Subclass 2
class KamarSuite extends KamarHotel {
  bool aksesLoungeVIP; 

  KamarSuite(String kodeKamar, double tarifMalam, this.aksesLoungeVIP)
      : super(kodeKamar, tarifMalam);

//Polymorphism dengan output berbeda
  @override
  void cetakDetail() {
    String statusLounge = aksesLoungeVIP ? "Termasuk Akses Lounge" : "Tanpa Lounge";
    print("👑 TIPE SUITE   | No: $kodeKamar | Info: $statusLounge | Tarif: Rp$tarifMalam");
  }
}

//======================================================
//3. CLASS TRANSAKSI (RELASI OBJEK)
//======================================================
class Booking {
  String namaPelanggan;
  KamarHotel kamarDipesan; 

  Booking(this.namaPelanggan, this.kamarDipesan);

  void notaPemesanan() {
    print("Nama Pelanggan : $namaPelanggan");
    kamarDipesan.cetakDetail(); //Eksekusi method dari objek kamar
  }
}

//======================================================
//4. MAIN PROGRAM
//======================================================
void main() {
  print("========================================");
  print("           RESERVASI HOTEL CLI          ");
  print("========================================");
  print(" ");
  //Instansiasi Object Kamar
  KamarReguler ruang101 = KamarReguler("101-R", 450000, true);
  KamarSuite ruang999 = KamarSuite("999-S", 1850000, true);

  //Demonstrasi Polymorphism
  ruang101.cetakDetail();
  ruang999.cetakDetail();

  print(" ");
  print("========================================");
  print("          Catatan Booking Masuk         ");
  print("========================================");
  print(" ");
  Booking trx01 = Booking("Supri SPX", ruang101);
  Booking trx02 = Booking("Rina Supriyanti", ruang999);

  trx01.notaPemesanan();
  print(" ");
  trx02.notaPemesanan();

  print(" ");
  print("========================================");
  print("  Simulasi Update Tarif (Encapsulation) ");
  print("========================================");
  print(" ");
  //Mencoba input tarif minus (Harus ditolak)
  ruang101.tarifMalam = -75000;

  //Mencoba input tarif normal (Harus diterima)
  ruang101.tarifMalam = 500000;

  print("Program selesai.");
}

