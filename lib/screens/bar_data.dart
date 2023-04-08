import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'data.dart';

class BarData {
  static List<Data> barData = [];

  static Future<void> loadData() async {
    final csvString = await rootBundle.loadString('assets/revenue.csv');
    final List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(csvString);
    barData = rowsAsListOfValues.skip(1)
        .map((row) => Data(
              month: _getMonthFromString((row[0]).toString()),
              revenue: double.parse(row[1].toString()),
              profit: double.parse(row[2].toString()),
            ))
        .toList();
  }
}

int _getMonthFromString(String monthString) {
    switch (monthString.toLowerCase()) {
      case 'january':
        return 1;
      case 'february':
        return 2;
      case 'march':
        return 3;
      case 'april':
        return 4;
      case 'may':
        return 5;
      case 'june':
        return 6;
      case 'july':
        return 7;
      case 'august':
        return 8;
      case 'september':
        return 9;
      case 'october':
        return 10;
      case 'november':
        return 11;
      case 'december':
        return 12;
      default:
        throw FormatException('Invalid month string: $monthString');
    }
  }

