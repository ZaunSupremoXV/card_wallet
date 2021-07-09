import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:flutter/material.dart';

final String tableCardes = 'cardes';

class CardeFields {
  static final List<String> values = [
    // Adicone todas as fields
    id,
    isImportant,
    number,
    title,
    description,
    time,
    cardHolderName,
    cardNumber,
    company,
    thruMonth,
    thruYear,
    fromMonth,
    fromYear
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
  static final String cardHolderName = 'cardHolderName';
  static final String cardNumber = 'cardNumber';
  static final String company = 'company';
  static final String thruMonth = 'thruMonth';
  static final String thruYear = 'thruYear';
  static final String fromMonth = 'fromMonth';
  static final String fromYear = 'fromYear';
}

class Carde {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;
  final String cardHolderName;
  final String cardNumber;
  final String company;
  final int thruMonth;
  final int thruYear;
  final int fromMonth;
  final int fromYear;

  const Carde({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
    required this.cardHolderName,
    required this.cardNumber,
    required this.company,
    required this.thruMonth,
    required this.thruYear,
    required this.fromMonth,
    required this.fromYear,
  });

  Carde copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
    String? cardHolderName,
    String? cardNumber,
    String? company,
    int? thruMonth,
    int? thruYear,
    int? fromMonth,
    int? fromYear,
  }) =>
      Carde(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        cardHolderName: cardHolderName ?? this.cardHolderName,
        cardNumber: cardNumber ?? this.cardNumber,
        company: company ?? this.company,
        //
        thruMonth: thruMonth ?? this.thruMonth,
        thruYear: thruYear ?? this.thruYear,
        fromMonth: fromMonth ?? this.fromMonth,
        fromYear: fromYear ?? this.fromYear,
      );

  static Carde fromJson(Map<String, Object?> json) => Carde(
        id: json[CardeFields.id] as int?,
        isImportant: json[CardeFields.isImportant] == 1,
        number: json[CardeFields.number] as int,
        title: json[CardeFields.title] as String,
        description: json[CardeFields.description] as String,
        createdTime: DateTime.parse(json[CardeFields.time] as String),
        cardHolderName: json[CardeFields.cardHolderName] as String,
        cardNumber: json[CardeFields.cardNumber] as String,
        company: json[CardeFields.company] as String,
        thruMonth: json[CardeFields.thruMonth] as int,
        thruYear: json[CardeFields.thruYear] as int,
        fromMonth: json[CardeFields.fromMonth] as int,
        fromYear: json[CardeFields.fromYear] as int,
      );

  Map<String, Object?> toJson() => {
        CardeFields.id: id,
        CardeFields.title: title,
        CardeFields.isImportant: isImportant ? 1 : 0,
        CardeFields.number: number,
        CardeFields.description: description,
        CardeFields.time: createdTime.toIso8601String(),
        CardeFields.cardHolderName: cardHolderName,
        CardeFields.cardNumber: cardNumber,
        CardeFields.company: company,
        CardeFields.thruMonth: thruMonth,
        CardeFields.thruYear: thruYear,
        CardeFields.fromMonth: fromMonth,
        CardeFields.fromYear: fromYear,
      };
}
