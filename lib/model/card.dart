import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:flutter/material.dart';

final String tableCardes = 'cardes';

class CardeFields {
  static final List<String> values = [
    // Adicone todas as fields
    id,
    isImportant,
    title,
    description,
    time,
    cardHolderName,
    cardNumber,
    cardVencimento,
    cardCvv,
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
  static final String cardHolderName = 'cardHolderName';
  static final String cardNumber = 'cardNumber';
  static final String cardVencimento = 'cardVencimento';
  static final String cardCvv = 'cardCvv';
}

class Carde {
  final int? id;
  final bool isImportant;
  final String title;
  final String description;
  final DateTime createdTime;
  final String cardHolderName;
  final String cardNumber;
  final String cardVencimento;
  final String cardCvv;

  const Carde({
    this.id,
    required this.isImportant,
    required this.title,
    required this.description,
    required this.createdTime,
    required this.cardHolderName,
    required this.cardNumber,
    required this.cardVencimento,
    required this.cardCvv,
  });

  Carde copy({
    int? id,
    bool? isImportant,
    String? title,
    String? description,
    DateTime? createdTime,
    String? cardHolderName,
    String? cardNumber,
    String? cardVencimento,
    String? cardCvv,
  }) =>
      Carde(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        cardHolderName: cardHolderName ?? this.cardHolderName,
        cardNumber: cardNumber ?? this.cardNumber,
        cardVencimento: cardVencimento ?? this.cardVencimento,
        cardCvv: cardCvv ?? this.cardCvv,
      );

  static Carde fromJson(Map<String, Object?> json) => Carde(
        id: json[CardeFields.id] as int?,
        isImportant: json[CardeFields.isImportant] == 1,
        title: json[CardeFields.title] as String,
        description: json[CardeFields.description] as String,
        createdTime: DateTime.parse(json[CardeFields.time] as String),
        cardHolderName: json[CardeFields.cardHolderName] as String,
        cardNumber: json[CardeFields.cardNumber] as String,
        cardVencimento: json[CardeFields.cardVencimento] as String,
        cardCvv: json[CardeFields.cardCvv] as String,
      );

  Map<String, Object?> toJson() => {
        CardeFields.id: id,
        CardeFields.title: title,
        CardeFields.isImportant: isImportant ? 1 : 0,
        CardeFields.description: description,
        CardeFields.time: createdTime.toIso8601String(),
        CardeFields.cardHolderName: cardHolderName,
        CardeFields.cardNumber: cardNumber,
        CardeFields.cardVencimento: cardVencimento,
        CardeFields.cardCvv: cardCvv,
      };
}
