import 'package:catalog_app/models/catalog.dart';

import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:catalog_app/widgets/home_widgets/catalor_header.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      // appBar: AppBar(
      //   title: Text('Catalog App'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}







// ListView.builder(
//                   itemCount: CatalogModel.items.length,
//                   itemBuilder: (context, index) {
//                     return ItemWidget(
//                       item: CatalogModel.items[index],
//                     );
//                   },
//                 )

// Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//             ? GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16.0,
//                   crossAxisSpacing: 16.0,
//                 ),
//                 itemBuilder: (context, index) {
//                   final item = CatalogModel.items[index];
//                   return Card(
//                     clipBehavior: Clip.antiAlias,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: GridTile(
//                       header: Container(
//                         child: Text(
//                           item.name,
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         padding: EdgeInsets.all(12.0),
//                         decoration: BoxDecoration(color: Colors.deepPurple),
//                       ),
//                       child: Image.network(item.image),
//                       footer: Container(
//                         child: Text(
//                           item.price.toString(),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         padding: EdgeInsets.all(12.0),
//                         decoration: BoxDecoration(color: Colors.black),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: CatalogModel.items.length,
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),
//       drawer: MyDrawer(),
