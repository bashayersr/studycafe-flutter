import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarybook/views/screens/user/details.dart';

import '../../../logic/controllers/prodect_controller.dart';
import '../../../routes.dart';


class CardItem extends StatelessWidget {
  final controller = Get.find<ProdectController>();
  List prodects = [];

  CardItem({Key? key, required this.prodects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: prodects.length,

            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

                childAspectRatio: .8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 15.0,

                maxCrossAxisExtent: 214),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 214,
                  width: 169,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                          width: 153,
                          height: 128,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 106,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${prodects[index].imageUrl}'),
                                        fit: BoxFit.fill)),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${prodects[index].productName}",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            )),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${prodects[index].category}",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(151, 151, 151, 1),
                                fontSize: 10,
                              ),
                            )),
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Icon(
                                Icons.star_sharp,
                                semanticLabel: prodects[index].quantity.toString(),
                                color: Colors.orange,
                              ),
                              Text(" 4.5 (190)")
                              
                            ],)
                            ,
                            IconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.details,arguments: CafeDetails(products: prodects[index]));
                                },
                                icon: Icon(Icons.info_outline)),
                          ],
                        ),
                      ),
                      // Text('${controller.favouritesList[index]['productNumber']}')
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
