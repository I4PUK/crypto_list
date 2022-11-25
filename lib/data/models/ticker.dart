import 'package:crypto_list/domain/entities/ticker.dart';

class TickerModel extends TickerEntity {
  TickerModel({required String name, required num value})
      : super(name: name, value: value.toDouble());
}
