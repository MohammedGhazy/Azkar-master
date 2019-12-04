import 'package:scoped_model/scoped_model.dart';
class AppModel extends Model {
  List<Items> _items = [];
  List<Items> get items => _items;

  void addItem(Items item){
    _items.add(item);
    notifyListeners();
  }

  void deleteItem(Items item) {
    _items.remove(item);
    notifyListeners();
  }
}
class Items{
  final String name;
  Items(this.name);
}

