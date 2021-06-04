import 'package:flutter/material.dart';
import 'package:food/Screens/category_screen.dart';
import 'package:food/Screens/favorite_screen.dart';
import 'package:food/Screens/filters.dart';
import 'package:food/Screens/main_drawer.dart';
import 'package:food/models/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeal;

  TabsScreen(this.favoriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;
  final List<String> _title = ['Category', 'Favorite'];

  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      CategoryScreen(),
      Favorite(widget.favoriteMeal),
    ];

    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_selectedPageIndex]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
