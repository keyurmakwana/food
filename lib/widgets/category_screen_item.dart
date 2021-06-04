import 'package:flutter/material.dart';
import 'package:food/Screens/meal_screen.dart';

class CategoryScreenItem extends StatelessWidget {
  final String id,title;
  final Color color;

  CategoryScreenItem(this.id,this.color,this.title);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(MealScreen.routeName,arguments: {'id':id,'title':title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,style: Theme.of(context).textTheme.headline3,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7),color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
