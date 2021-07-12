import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardeFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final String? cardHolderName;
  final String? cardNumber;

  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedcardHolderName;
  final ValueChanged<String> onChangedcardNumber;

  const CardeFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    this.cardHolderName,
    this.cardNumber,
    required this.onChangedDescription,
    required this.onChangedcardHolderName,
    required this.onChangedcardNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Switch(
                    value: isImportant ?? false,
                    onChanged: onChangedImportant,
                  ),
                  Expanded(
                    child: Slider(
                      value: (number ?? 0).toDouble(),
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (number) => onChangedNumber(number.toInt()),
                    ),
                  )
                ],
              ),
              buildTitle(),
              buildDescription(),
              buildcardHolderName(),
              buildcardNumber(),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.white70),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O título não pode estar vazio'
            : null,
        onChanged: onChangedTitle,
      );

  Widget buildDescription() => TextFormField(
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Descrição',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'A descrição não pode estar vazio'
            : null,
        onChanged: onChangedDescription,
      );

  Widget buildcardHolderName() => TextFormField(
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Dono do cartão',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O dono não pode estar vazio'
            : null,
        onChanged: onChangedcardHolderName,
      );

  Widget buildcardNumber() => TextFormField(
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Número do cartão',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O número do cartão não pode estar vazio'
            : null,
        onChanged: onChangedcardNumber,
      );
}
