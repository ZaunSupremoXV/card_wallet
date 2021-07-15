import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardeFormWidget extends StatelessWidget {
  final bool? isImportant;
  final String? title;
  final String? description;
  final String? cardHolderName;
  final String? cardNumber;
  final String? cardVencimento;
  final String? cardCvv;

  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedcardHolderName;
  final ValueChanged<String> onChangedcardNumber;
  final ValueChanged<String> onChangedcardVencimento;
  final ValueChanged<String> onChangedcardCvv;

  const CardeFormWidget({
    Key? key,
    this.isImportant = false,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedTitle,
    this.cardHolderName,
    this.cardNumber,
    this.cardVencimento,
    this.cardCvv,
    required this.onChangedDescription,
    required this.onChangedcardHolderName,
    required this.onChangedcardNumber,
    required this.onChangedcardVencimento,
    required this.onChangedcardCvv,
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
                  Text(
                    "É importante? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(width: 10),
                  Switch(
                    value: isImportant ?? false,
                    onChanged: onChangedImportant,
                    activeColor: Colors.yellowAccent,
                  ),
                ],
              ),
              SizedBox(height: 10),
              buildTitle(),
              SizedBox(height: 30),
              buildDescription(),
              SizedBox(height: 30),
              buildcardHolderName(),
              SizedBox(height: 30),
              buildcardNumber(),
              SizedBox(height: 10),
              buildcardVencimento(),
              SizedBox(height: 10),
              buildcardCvv(),
              SizedBox(height: 10),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "Título do cartão",
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.yellowAccent,
              width: 2.0,
            ),
          ),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O título do cartão não pode estar vazio!'
            : null,
        onChanged: onChangedTitle,
      );

  Widget buildDescription() => TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "Descrição do cartão",
          labelStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.yellowAccent,
              width: 2.0,
            ),
          ),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'A descrição do cartão não pode estar vazio!'
            : null,
        onChanged: onChangedDescription,
      );

  Widget buildcardHolderName() => TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "Dono do cartão",
          labelStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.yellowAccent,
              width: 2.0,
            ),
          ),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O dono do cartão não pode estar vazio!'
            : null,
        onChanged: onChangedcardHolderName,
      );

  Widget buildcardVencimento() => TextFormField(
        inputFormatters: [TextInputMask(mask: '99/99')],
        maxLength: 5,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "Vencimento do cartão",
          labelStyle: TextStyle(color: Colors.white),
          counterStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.yellowAccent,
              width: 2.0,
            ),
          ),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O vencimento do cartão não pode estar vazio!'
            : null,
        onChanged: onChangedcardVencimento,
      );

  Widget buildcardCvv() => TextFormField(
        inputFormatters: [TextInputMask(mask: '999')],
        maxLength: 3,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "CVV do cartão",
          labelStyle: TextStyle(color: Colors.white),
          counterStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.yellowAccent,
              width: 2.0,
            ),
          ),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O CVV do cartão não pode estar vazio!'
            : null,
        onChanged: onChangedcardCvv,
      );

  Widget buildcardNumber() => TextFormField(
        inputFormatters: [TextInputMask(mask: '9999 9999 9999 9999')],
        maxLength: 19,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "Número do cartão",
          labelStyle: TextStyle(color: Colors.white),
          counterStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.yellowAccent,
              width: 2.0,
            ),
          ),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'O número do cartão não pode estar vazio!'
            : null,
        onChanged: onChangedcardNumber,
      );
}
