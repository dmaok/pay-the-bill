import '../data_models.dart';
import 'tariff_service.dart';

class BillCalculator {
  final TariffService _tariffService;

  BillCalculator(this._tariffService);

  double calculateBill(List<CounterReading> readings, Tariff tariff, DateTime date) {
    if (readings.isEmpty) {
      return 0;
    }

    readings.sort((a, b) => a.date.compareTo(b.date));
    CounterReading? previousReading;
    CounterReading currentReading = readings.last;

    for (int i = readings.length - 2; i >= 0; i--) {
      if (readings[i].date.isBefore(currentReading.date)) {
        previousReading = readings[i];
        break;
      }
    }

    if (previousReading == null) {
      return 0;
    }

    double difference = currentReading.value - previousReading.value;
    return difference * tariff.value;
  }

  double calculateTotalBill(List<BillType> billTypes, DateTime date) {
    double totalCost = 0;
    for (var billType in billTypes) {
      Tariff? tariff = _tariffService.getTariff(billType, date);
      if (tariff != null) {
        totalCost += calculateBill(billType.counterReadings, tariff, date);
      }
    }
    return totalCost;
  }
}