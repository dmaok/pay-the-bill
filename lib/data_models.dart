class BillType {
  final String name;
  final List<CounterReading> counterReadings;

  BillType({required this.name, required this.counterReadings});
}

class CounterReading {
  final double value;
  final DateTime date;

  CounterReading({required this.value, required this.date});
}

class Tariff {
  final double value;
  final String billType;
  final DateTime dateFrom;
  final DateTime? dateTo;

  Tariff({
    required this.value,
    required this.billType,
    required this.dateFrom,
    this.dateTo,
  });
}

class BillHistoryEntry {
  final DateTime date;
  final List<CounterReading> counterReadings;
  final List<Tariff> tariffs;

  BillHistoryEntry({
    required this.date,
    required this.counterReadings,
    required this.tariffs,
  });
}