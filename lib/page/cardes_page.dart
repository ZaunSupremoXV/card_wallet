import 'dart:ffi';

import 'package:card_wallet/db/card_database.dart';
import 'package:card_wallet/model/card.dart';
import 'package:card_wallet/page/edit_carde_page.dart';
import 'package:card_wallet/shared/widget/carde_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'carde_detail_page.dart';

class CardesPage extends StatefulWidget {
  const CardesPage({Key? key}) : super(key: key);

  @override
  _CardesPageState createState() => _CardesPageState();
}

class _CardesPageState extends State<CardesPage> {
  late List<Carde> cardes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshCardes();
  }

  @override
  void dispose() {
    CardesDatabase.instance.close();

    super.dispose();
  }

  Future refreshCardes() async {
    setState(() => isLoading = true);
    this.cardes = await CardesDatabase.instance.readAllCardes();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Cartões',
            style: TextStyle(fontSize: 24),
          ),
          actions: [Icon(Icons.search), SizedBox(width: 12)],
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : cardes.isEmpty
                  ? Text(
                      'No Cardes',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : buildCardes(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditCardePage()),
            );

            refreshCardes();
          },
        ),
      );

  Widget buildCardes() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: cardes.length,
          itemBuilder: (context, index) {
            final carde = cardes[index];

            return GestureDetector(
              onTap: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CardeDetailPage(cardeId: carde.id!),
                ));

                refreshCardes();
              },
              child: CardeCardWidget(carde: carde, index: index),
            );
          },
        ),
      );
}
