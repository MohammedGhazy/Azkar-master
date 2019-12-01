import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel extends Model {
  List<Item> _items = [];
  List<Item> get items => _items;

  void addItem(Item item) async{
    _items.add(item);
  }

  void deleteItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}

class Item {
  final String name;

  Item(this.name);
}
