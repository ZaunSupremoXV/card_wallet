import 'package:card_wallet/db/card_database.dart';
import 'package:card_wallet/model/card.dart';
import 'package:card_wallet/shared/widget/carde_form_widget.dart';
import 'package:flutter/material.dart';

class AddEditCardePage extends StatefulWidget {
  final Carde? carde;

  const AddEditCardePage({
    Key? key,
    this.carde,
  }) : super(key: key);
  @override
  _AddEditCardePageState createState() => _AddEditCardePageState();
}

class _AddEditCardePageState extends State<AddEditCardePage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;
  late String cardHolderName;
  late String cardNumber;

  @override
  void initState() {
    super.initState();

    isImportant = widget.carde?.isImportant ?? false;
    number = widget.carde?.number ?? 0;
    title = widget.carde?.title ?? '';
    description = widget.carde?.description ?? '';
    cardHolderName = widget.carde?.cardHolderName ?? '';
    cardNumber = widget.carde?.cardNumber ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: CardeFormWidget(
            isImportant: isImportant,
            number: number,
            title: title,
            description: description,
            cardHolderName: cardHolderName,
            cardNumber: cardNumber,
            onChangedImportant: (isImportant) =>
                setState(() => this.isImportant = isImportant),
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onChangedcardHolderName: (cardHolderName) =>
                setState(() => this.cardHolderName = cardHolderName),
            onChangedcardNumber: (cardNumber) =>
                setState(() => this.cardNumber = cardNumber),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateCarde,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateCarde() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.carde != null;

      if (isUpdating) {
        await updateCarde();
      } else {
        await addCarde();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateCarde() async {
    final carde = widget.carde!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
    );

    await CardesDatabase.instance.update(carde);
  }

  Future addCarde() async {
    final carde = Carde(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
    );

    await CardesDatabase.instance.create(carde);
  }
}
