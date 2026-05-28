import 'dart:io';

import '../entity/product.dart';

class ProductManager {
  // Danh sách sản phẩm
  List<Product> productList = [
    const Product(
      id: "1",
      name: "iPhone 15",
      image: "iphone15.png",
      price: 2500,
    ),

    const Product(
      id: "2",
      name: "Samsung S24",
      image: "s24.png",
      price: 2200,
    ),

    const Product(
      id: "3",
      name: "MacBook Pro",
      image: "macbook.png",
      price: 3500,
    ),

    const Product(
      id: "4",
      name: "AirPods Pro",
      image: "airpods.png",
      price: 500,
    ),

    const Product(
      id: "5",
      name: "iPad Air",
      image: "ipadair.png",
      price: 1800,
    ),
  ];

  // =========================
  // KIỂM TRA ID
  // =========================
  bool isIdExist(String id) {
    for (var product in productList) {
      if (product.id == id) {
        return true;
      }
    }

    return false;
  }

  // =========================
  // HEADER
  // =========================
  void printHeader() {
    print(
      "=================================================================",
    );

    print(
      "| ID   | NAME                 | IMAGE              | PRICE      |",
    );

    print(
      "=================================================================",
    );
  }

  // =========================
  // IN 1 PRODUCT
  // =========================
  void printProduct(Product product) {
    print(
      "| ${product.id.padRight(4)} "
          "| ${product.name.padRight(20)} "
          "| ${(product.image ?? "").padRight(18)} "
          "| ${product.price.toStringAsFixed(2).padRight(10)} |",
    );
  }

  // =========================
  // HIỂN THỊ DANH SÁCH
  // =========================
  void showProducts() {
    if (productList.isEmpty) {
      print("Danh sách trống!");
      return;
    }

    printHeader();

    for (var product in productList) {
      printProduct(product);
    }

    print(
      "=================================================================",
    );
  }

  // =========================
  // THÊM SẢN PHẨM
  // =========================
  void addProduct() {
    print("===== ADD PRODUCT =====");

    String id;

    while (true) {
      stdout.write("Enter ID: ");

      id = stdin.readLineSync()!;

      if (isIdExist(id)) {
        print("ID already exists!");
      } else {
        break;
      }
    }

    stdout.write("Enter Name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter Image: ");
    String image = stdin.readLineSync()!;

    stdout.write("Enter Price: ");
    double price = double.parse(stdin.readLineSync()!);

    productList.add(
      Product(
        id: id,
        name: name,
        image: image,
        price: price,
      ),
    );

    print("Add success!");
  }

  // =========================
  // XÓA SẢN PHẨM
  // =========================
  void deleteProduct() {
    stdout.write("Enter ID delete: ");

    String id = stdin.readLineSync()!;

    bool found = false;

    for (var product in productList) {
      if (product.id == id) {
        found = true;
        break;
      }
    }

    if (found) {
      productList.removeWhere(
            (product) => product.id == id,
      );

      print("Delete success!");
    } else {
      print("Product not found!");
    }
  }

  // =========================
  // UPDATE PRODUCT
  // =========================
  void updateProduct() {
    stdout.write("Enter ID update: ");

    String id = stdin.readLineSync()!;

    int index = productList.indexWhere(
          (product) => product.id == id,
    );

    if (index == -1) {
      print("Product not found!");
      return;
    }

    stdout.write("Enter new name: ");
    String newName = stdin.readLineSync()!;

    stdout.write("Enter new image: ");
    String newImage = stdin.readLineSync()!;

    stdout.write("Enter new price: ");
    double newPrice = double.parse(stdin.readLineSync()!);

    // dùng copyWith vì object immutable
    productList[index] = productList[index].copyWith(
      name: newName,
      image: newImage,
      price: newPrice,
    );

    print("Update success!");
  }

  // =========================
  // SEARCH
  // =========================
  void searchProduct() {
    stdout.write("Enter keyword: ");

    String keyword = stdin.readLineSync()!.toLowerCase();

    var result = productList.where(
          (product) => product.name
          .toLowerCase()
          .contains(keyword),
    ).toList();

    if (result.isEmpty) {
      print("Not found!");
      return;
    }

    printHeader();

    for (var product in result) {
      printProduct(product);
    }

    print(
      "=================================================================",
    );
  }

  // =========================
  // SORT
  // =========================
  void sortProduct() {
    print("===== SORT MENU =====");

    print("1. Price Ascending");

    print("2. Price Descending");

    stdout.write("Choose option: ");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        productList.sort(
              (a, b) => a.price.compareTo(b.price),
        );

        print("Sorted ascending!");
        break;

      case 2:
        productList.sort(
              (a, b) => b.price.compareTo(a.price),
        );

        print("Sorted descending!");
        break;

      default:
        print("Invalid choice!");
    }
  }

  // =========================
  // TĂNG GIÁ 10%
  // =========================
  void increasePrice() {
    productList = productList.map((product) {
      return product.copyWith(
        price: product.price * 1.1,
      );
    }).toList();

    print("Increase price success!");
  }

  // =========================
  // FIND PRODUCT
  // =========================
  Product? findProduct(String id) {
    try {
      return productList.firstWhere(
            (product) => product.id == id,
      );
    } catch (e) {
      return null;
    }
  }
}