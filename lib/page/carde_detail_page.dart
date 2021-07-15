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
                    Center(
                      child: Text(
                        carde.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Descrição",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellowAccent),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Text(
                          carde.description,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Informações do Cartão",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellowAccent),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Dono do cartão ',
                                style: TextStyle(color: Colors.white70),
                                children: [
                                  TextSpan(
                                    text: carde.cardHolderName,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'N° cartão ',
                                style: TextStyle(color: Colors.white70),
                                children: [
                                  TextSpan(
                                    text: carde.cardNumber,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'CVV ',
                                style: TextStyle(color: Colors.white70),
                                children: [
                                  TextSpan(
                                    text: carde.cardCvv,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'Vence em ',
                                style: TextStyle(color: Colors.white70),
                                children: [
                                  TextSpan(
                                    text: carde.cardVencimento,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'Última alteração em ',
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text:
                                  DateFormat.yMMMd().format(carde.createdTime),
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined, color: Colors.white),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditCardePage(carde: carde),
        ));

        refreshCarde();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete, color: Colors.white),
        onPressed: () async {
          await CardesDatabase.instance.delete(widget.cardeId);

          Navigator.of(context).pop();
        },
      );
}
