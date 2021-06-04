import 'package:flutter/material.dart';
import 'package:food/Screens/main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilter;

  final Map<String,dynamic> currentFilter;

  Filters(this.saveFilter,this.currentFilter);


  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutanFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutanFree=widget.currentFilter['glutan'];
    _lactoseFree=widget.currentFilter['lactose'];
    _vegetarian=widget.currentFilter['vegetarian'];
    _vegan=widget.currentFilter['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(onPressed: () {
            final selectedFilter = {
              'glutan': _glutanFree,
              'lactose': _lactoseFree,
              'vegetarian': _vegetarian,
              'vegan': _vegan,
            };
            widget.saveFilter(selectedFilter);
          }, icon: Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(value: _glutanFree, onChanged: (newValue){
                setState(() {
                  _glutanFree=newValue;
                });
              },
              title: Text('Glutan free'),subtitle: Text('Only include glutan free food'),
              ),
              SwitchListTile(value: _lactoseFree, onChanged: (newValue){
                setState(() {
                  _lactoseFree=newValue;
                });
              },
                title: Text('Lactos free'),subtitle: Text('Only include lactos free food'),
              ),
              SwitchListTile(value: _vegetarian, onChanged: (newValue){
                setState(() {
                  _vegetarian=newValue;
                });
              },
                title: Text('Vegetarian food'),subtitle: Text('Only include Vegetarian food'),
              ),
              SwitchListTile(value: _vegan, onChanged: (newValue){
                setState(() {
                  _vegan=newValue;
                });
              },
                title: Text('Vegan food'),subtitle: Text('Only include Vegan food'),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
