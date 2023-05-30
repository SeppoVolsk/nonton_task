import 'package:test/test.dart';
import '../bin/product.dart';

void main() {
  const testProducts = [
    Product("285654", "Диван угловой еврокнижка Мансберг экокожа коричневая"),
    Product("67200", "Шкаф-купе Бассо белое дерево"),
    Product("254666", "Шкаф-купе Бассо белое дерево"),
    Product(
        "103286", "Табурет Модерн с мягкой крышкой выбеленная береза / серый"),
    Product("89231", "Тумба для обуви Эва дуб сонома светлый"),
  ];

  group('addProducts', () {
    final productsImpl = ProductsImpl()..addProduct(testProducts[0]);

    test('добавляем одинаковые продукты', () {
      expect(false, productsImpl.addProduct(testProducts[0]));
    });
    test('добавляем разные продукты', () {
      expect(true, productsImpl.addProduct(testProducts[2]));
    });
  });

  group('deleteProducts', () {
    final productsImpl = ProductsImpl()..addProduct(testProducts[0]);

    test('удаляем существующий продукт', () {
      expect(true, productsImpl.deleteProduct(testProducts[0]));
    });
    test('удаляем отсутствующий в наборе продукт', () {
      expect(false, productsImpl.deleteProduct(testProducts[3]));
    });
  });

  group('getName', () {
    final productsImpl = ProductsImpl()
      ..addProduct(testProducts[0])
      ..addProduct(testProducts[1]);

    test('получаем имя продукта из набора', () {
      expect(testProducts[1].name, productsImpl.getName(testProducts[1].id));
    });

    test('получаем "" если продукта нет в наборе', () {
      expect("", productsImpl.getName(testProducts[2].id));
    });
  });

  group('findByName', () {
    final productsImpl = ProductsImpl()
      ..addProduct(testProducts[0])
      ..addProduct(testProducts[1]) // "Шкаф-купе Бассо белое дерево"
      ..addProduct(testProducts[2]) // "Шкаф-купе Бассо белое дерево"
      ..addProduct(testProducts[3]);

    test('получаем список id имеющих одинаковый name', () {
      expect([testProducts[1].id, testProducts[2].id],
          productsImpl.findByName(testProducts[1].name));
    });
    test('получаем пустой список, если такого name нет', () {
      expect([], productsImpl.findByName(testProducts[4].name));
    });
  });
}
