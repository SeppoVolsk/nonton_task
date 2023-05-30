// задание необходимо выполнить на любом C-подобном языке
// в задаче нельзя использовать базы данных или любые другие бибилиотеки
// В целом вы не ограничены в реализации, только использовать стандартные структуры данных sdk
// необходимо реализовать все 4 функции в классе ProductsImpl
// реализоцию писать в теле самих функций
// вы в праве добавлять необходимые вам структуры данных в класс

// структура Product, id - уникальный номер продукта, name - наименование

class Product {
/* (1) Делаем класс иммутабельным */
  const Product(this.id, this.name);
  final String id;
  final String name;

/* (2) Переопределяем equals и hashCode для возможности использовать 
   объекты в коллекции
*/
  @override
  operator ==(covariant Product other) => other.id == id;
  @override
  int get hashCode => Object.hash(id, name);
}

//класс для реализации 4 функций
class ProductsImpl {
/* (3) Добавляем коллекцию для уникальных объектов  */
  final Set<Product> _products = {};

//добавляет новый продукт
// возвращает true - если продукта с таким id еще не было
// возвращает false - если был такой id, вставка отменяется
  bool addProduct(Product product) => _products.add(product);

//Удаляет продукт
// возвращает true - если продукт с таким id был
// возвроащает false - если id не было, (удаления не происходит)
  bool deleteProduct(Product product) => _products.remove(product);

//Получает имя (name) продукта
// возращает name продукта у которого идентификатор равен (=) id
// если продукта нет, вернуть пустую строку ""
  String getName(String id) => _products
      .firstWhere((product) => product.id == id,
          orElse: () => const Product("", ""))
      .name;

//возвращает массив (список) идентификаторов (id)
// У котрых наименование равно (=) name
// Если таких нет, возвращается пустой массив (список)
  List<String> findByName(String name) => _products
      .where((product) => product.name == name)
      .map((p) => p.id)
      .toList();
}
