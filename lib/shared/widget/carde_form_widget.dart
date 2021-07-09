import 'package:flutter/material.dart';

class CardeFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final String? cardHolderName;
  final String? cardNumber;
  final String? company;
  final int? thruMonth;
  final int? thruYear;
  final int? fromMonth;
  final int? fromYear;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedcardHolderName;
  final ValueChanged<String> onChangedcardNumber;
  final ValueChanged<String> onChangedcompany;
  final ValueChanged<int> onChangedthruMonth;
  final ValueChanged<int> onChangedthruYear;
  final ValueChanged<int> onChangedfromMonth;
  final ValueChanged<int> onChangedfromYear;

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
    this.company,
    this.thruMonth = 0,
    this.thruYear = 0,
    this.fromMonth = 0,
    this.fromYear = 0,
    required this.onChangedDescription,
    required this.onChangedcardHolderName,
    required this.onChangedcardNumber,
    required this.onChangedcompany,
    required this.onChangedthruMonth,
    required this.onChangedthruYear,
    required this.onChangedfromMonth,
    required this.onChangedfromYear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              SizedBox(height: 8),
              buildDescription(),
              SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
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
        maxLines: 5,
        initialValue: description,
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'A descrição não pode estar vazio'
            : null,
        onChanged: onChangedDescription,
      );

  Widget buildcardHolderName() => TextFormField(
        maxLines: 5,
        initialValue: "-",
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O dono não pode estar vazio'
            : null,
        onChanged: onChangedcardHolderName,
      );

  Widget buildcardNumber() => TextFormField(
        maxLines: 5,
        initialValue: "-",
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O número do cartão não pode estar vazio'
            : null,
        onChanged: onChangedcardNumber,
      );

  Widget buildcompany() => TextFormField(
        maxLines: 5,
        initialValue: "-",
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'A companhia não pode estar vazio'
            : null,
        onChanged: onChangedcompany,
      );

  Widget buildthruMonth() => TextFormField(
        maxLines: 5,
        initialValue: "-",
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O mês de não pode estar vazio'
            : null,
        onChanged: (thruMonth) => onChangedthruMonth,
      );

  Widget buildthruYear() => TextFormField(
        maxLines: 5,
        initialValue: "-",
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O ano de não pode estar vazio'
            : null,
        onChanged: (thruYear) => onChangedthruYear,
      );

  Widget buildfromMonth() => TextFormField(
        maxLines: 5,
        initialValue: "-",
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O mês ate não pode estar vazio'
            : null,
        onChanged: (fromMonth) => onChangedfromMonth,
      );

  Widget buildfromYear() => TextFormField(
        maxLines: 5,
        initialValue: "-",
        style: TextStyle(color: Colors.white60, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.white60),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O ano ate não pode estar vazio'
            : null,
        onChanged: (fromYear) => onChangedfromYear,
      );
}
