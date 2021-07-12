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
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
  static final String cardHolderName = 'cardHolderName';
  static final String cardNumber = 'cardNumber';
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

  const Carde({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
    required this.cardHolderName,
    required this.cardNumber,
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
      };
}
