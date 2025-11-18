import 'hewan.dart';

class Kucing extends Hewan {
  String warnaBulu;

  Kucing(String nama, double berat, this.warnaBulu) : super(nama, berat);

  @override
  void makan(double porsiKg) {
    super.makan(porsiKg);
  }

  @override
  void lari(double jarakKg) {
    super.lari(jarakKg);
  }
}