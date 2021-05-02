import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>
{

  final products={"jkns","aa","bb"};

  final recentProducts={};
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon:Icon(Icons.clear),onPressed: (){})];
    throw UnimplementedError();
  }

  @override
  Animation<double> get transitionAnimation {

  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon:AnimatedIcon(icon:AnimatedIcons.menu_arrow,progress:transitionAnimation),onPressed: (){},);
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

}