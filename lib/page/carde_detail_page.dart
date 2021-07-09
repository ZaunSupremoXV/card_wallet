import 'package:card_wallet/db/card_database.dart';
import 'package:card_wallet/model/card.dart';
import 'package:card_wallet/page/edit_carde_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardeDetailPage extends StatefulWidget {
  final int cardeId;

  const CardeDetailPage({
    Key? key,
    required this.cardeId,
  }) : super(key: key);

  @override
  _CardeDetailPageState createState() => _CardeDetailPageState();
}

class _CardeDetailPageState extends State<CardeDetailPage> {
  late Carde carde;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshCarde();
  }

  Future refreshCarde() async {
    setState(() => isLoading = true);

    this.carde = await CardesDatabase.instance.readCarde(widget.cardeId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      carde.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(carde.createdTime),
                      style: TextStyle(color: Colors.white38),
                    ),
                    SizedBox(height: 8),
                    Text(
                      carde.description,
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditCardePage(carde: carde),
        ));

        refreshCarde();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await CardesDatabase.instance.delete(widget.cardeId);

          Navigator.of(context).pop();
        },
      );
}
