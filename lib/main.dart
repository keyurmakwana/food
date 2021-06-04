import 'package:flutter/material.dart';
import 'package:food/Screens/category_screen.dart';
import 'package:food/Screens/filters.dart';
import 'package:food/Screens/meal_detail_screen.dart';
import 'package:food/Screens/meal_screen.dart';
import 'package:food/Screens/tabs_screen.dart';
import 'package:food/dummy_data.dart';
import 'package:food/models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> _filters = {
    'glutan': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;

  List<Meal> _favoriteMeal = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeal = DUMMY_MEALS.where((element) {
        if (_filters['glutan'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final exsitingMeal =
        _favoriteMeal.indexWhere((element) => mealID == element.id);
    if (exsitingMeal >= 0) {
      setState(() {
        _favoriteMeal.removeAt(exsitingMeal);
      });
    } else {
      setState(() {
        _favoriteMeal
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
      });
    }
  }

  bool _isMealFavorite(String mealID){
    return _favoriteMeal.any((element) => element.id==mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                headline3: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeal),
        MealScreen.routeName: (ctx) => MealScreen(_availableMeal),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        Filters.routeName: (ctx) => Filters(_setFilters, _filters),
      },
    );
  }
}
