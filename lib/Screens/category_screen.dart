import 'package:flutter/material.dart';
import 'package:food/widgets/category_screen_item.dart';
import 'package:food/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GridView(
            padding: EdgeInsets.all(15),
            children: DUMMY_CATEGORIES.map((item){
              return CategoryScreenItem(item.id, item.color, item.title);
            }).toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3/2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
            ),);
  }
}
