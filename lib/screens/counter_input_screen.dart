import 'package:flutter/material.dart';
import 'package:myapp/data_models.dart';
import 'package:myapp/services/bill_calculator.dart';

class CounterInputScreen extends StatefulWidget {
  const CounterInputScreen({super.key});

  @override
  State<CounterInputScreen> createState() => _CounterInputScreenState();
}

class _CounterInputScreenState extends State<CounterInputScreen> {
  DateTime currentDate = DateTime.now();
  Map<BillType, double> counterReadings = {};
  double totalBill = 0.0;
  final BillCalculator billCalculator = BillCalculator();

  @override
  void initState() {
    super.initState();
    for (var name in BillTypeName.values) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var billType in counterReadings.keys)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: billType.name.name,
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false
                  ),
                  onChanged: (value) {
                      setState(() {
                        counterReadings[billType] = double.tryParse(value) ?? 0.0;
                      });
                      decimal: true, signed: false),
                  onChanged: (value) {
                    setState(() {
                      counterReadings[billType] = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
              ),
            ElevatedButton(
              onPressed: _calculateTotal,
              child: const Text('Calculate'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text('Total Bill: $totalBill'),
            ),
          ],
        ),
      ),
    );
  }
    void _calculateTotal() {
    setState(() {
       totalBill = billCalculator.calculateTotalBill(
         counterReadings.keys.toList(),
         currentDate,
       );
    });
   }
}