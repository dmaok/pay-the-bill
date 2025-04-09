import 'package:myapp/data_models.dart';

class TariffService {
  List<Tariff> _tariffs = [];

  TariffService() {
    _initializeTariffs();
  }

  void _initializeTariffs() {
    _tariffs = [
      Tariff(
        billType: BillType(name: 'electricity', counterReadings: []),
        value: 0.25,
        dateFrom: DateTime(2023, 1, 1),
        dateTo: DateTime(2024, 12, 31),
      ),
      Tariff(
        billType: BillType(name: 'central heating', counterReadings: []),
        value: 1.5,
        dateFrom: DateTime(2023, 1, 1),
        dateTo: DateTime(2024, 12, 31),
      ),
      Tariff(
        billType: BillType(name: 'cold water', counterReadings: []),
        value: 0.5,
        dateFrom: DateTime(2023, 1, 1),
        dateTo: DateTime(2024, 12, 31),
      ),
      Tariff(
        billType: BillType(name: 'hot water', counterReadings: []),
        value: 1.2,
        dateFrom: DateTime(2023, 1, 1),
        dateTo: DateTime(2024, 12, 31),
      ),
      Tariff(
        billType: BillType(name: 'exploitation', counterReadings: []),
        value: 0.3,
        dateFrom: DateTime(2023, 1, 1),
        dateTo: DateTime(2024, 12, 31),
      ),
    ];
  }

  Tariff getTariff(BillType billType, DateTime date) {
    return _tariffs.firstWhere(
      (tariff) =>
          tariff.billType.name == billType.name &&
          date.isAfter(tariff.dateFrom.subtract(Duration(days: 1))) &&
          date.isBefore(tariff.dateTo.add(Duration(days: 1))),
      orElse: () => throw Exception('No tariff found for $billType at $date'),
    );
  }
}