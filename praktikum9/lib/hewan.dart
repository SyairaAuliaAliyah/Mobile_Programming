class Hewan {
  String nama;
  double berat;

  Hewan(this.nama, this.berat);

  void makan(double porsiKg) {
    berat += porsiKg;
  }

  void lari(double jarakKg) {
    berat -= jarakKg;
    if (berat < 0) berat = 0; 
  }
}