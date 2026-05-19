import 'dart:io'; // Import thư viện nhập xuất dữ liệu

import '../entity/product.dart'; // Import class Product

// Class dùng để quản lý sản phẩm
class ProductManager {
  // Danh sách sản phẩm
  List<Product> productList = [
    // Product thứ 1
    Product(
      id: 1, // ID sản phẩm
      name: "iPhone 15", // Tên sản phẩm
      image: "iphone15.png", // Tên ảnh
      price: 2500, // Giá sản phẩm
    ),

    // Product thứ 2
    Product(id: 2, name: "Samsung S24", image: "s24.png", price: 2200),

    // Product thứ 3
    Product(id: 3, name: "MacBook Pro", image: "macbook.png", price: 3500),

    // Product thứ 4
    Product(id: 4, name: "AirPods Pro", image: "airpods.png", price: 500),

    // Product thứ 5
    Product(id: 5, name: "iPad Air", image: "ipadair.png", price: 1800),
  ];

  // Hàm kiểm tra ID có tồn tại không
  bool isIdExist(int id) {
    // Duyệt từng product trong danh sách
    for (var product in productList) {
      // Nếu ID nhập vào trùng ID product
      if (product.id == id) {
        return true; // Trả về true
      }
    }

    return false; // Không tìm thấy trả về false
  }

  // Hàm in header bảng
  void printHeader() {
    print(
      "=================================================================",
    ); // In dòng kẻ

    print(
      "| ID   | NAME                 | IMAGE              | PRICE      |",
    ); // In tiêu đề cột

    print(
      "=================================================================",
    ); // In dòng kẻ
  }

  // Hàm in 1 product
  void printProduct(Product product) {
    print(
      // toString() chuyển int -> String
      // padRight() căn lề phải cho đẹp
      "| ${product.id.toString().padRight(4)} "
      // In tên sản phẩm
          "| ${product.name.padRight(20)} "
      // In image
          "| ${product.image.padRight(18)} "
      // toStringAsFixed(2) hiển thị 2 số thập phân
          "| ${product.price.toStringAsFixed(2).padRight(10)} |",
    );
  }

  // Hàm hiển thị danh sách sản phẩm
  void showProducts() {
    // Kiểm tra danh sách rỗng
    if (productList.isEmpty) {
      print("Danh sách trống!"); // Thông báo

      return; // Kết thúc hàm
    }

    printHeader(); // Gọi hàm in header

    // Duyệt danh sách sản phẩm
    for (var product in productList) {
      printProduct(product); // In từng product
    }

    print(
      "=================================================================",
    ); // In cuối bảng
  }

  // Hàm thêm sản phẩm
  void addProduct() {
    print("===== ADD PRODUCT ====="); // In tiêu đề

    int id; // Khai báo biến id

    while (true) {
      // Lặp vô hạn

      stdout.write("Enter ID: "); // Yêu cầu nhập ID

      id = int.parse(stdin.readLineSync()!); // Nhập ID và chuyển String -> int

      if (isIdExist(id)) {
        // Nếu ID đã tồn tại

        print("ID already exists!"); // Báo lỗi
      } else {
        break; // Thoát vòng lặp nếu ID hợp lệ
      }
    }

    stdout.write("Enter Name: "); // Nhập tên

    String name = stdin.readLineSync()!; // Lưu tên

    stdout.write("Enter Image: "); // Nhập image

    String image = stdin.readLineSync()!; // Lưu image

    stdout.write("Enter Price: "); // Nhập giá

    double price = double.parse(
      stdin.readLineSync()!,
    ); // Chuyển String -> double

    productList.add(
      // Thêm product vào list
      Product(
        // Tạo object Product mới
        id: id, // Gán ID

        name: name, // Gán tên

        image: image, // Gán image

        price: price, // Gán giá
      ),
    );

    print("Add success!"); // Thông báo thành công
  }

  // Hàm xóa sản phẩm
  void deleteProduct() {
    stdout.write("Enter ID delete: "); // Yêu cầu nhập ID cần xóa

    int id = int.parse(stdin.readLineSync()!); // Nhập ID

    bool found = false; // Biến kiểm tra tìm thấy

    // Duyệt danh sách
    for (var product in productList) {
      if (product.id == id) {
        // Nếu ID trùng

        found = true; // Đánh dấu tìm thấy

        break; // Thoát vòng lặp
      }
    }

    if (found) {
      // Nếu tìm thấy

      productList.removeWhere(
        // removeWhere() dùng để xóa theo điều kiện
            (product) => product.id == id, // Điều kiện xóa
      );

      print("Delete success!"); // Thông báo thành công
    } else {
      print("Product not found!"); // Không tìm thấy
    }
  }

  // Hàm sửa sản phẩm
  void updateProduct() {
    stdout.write("Enter ID update: "); // Nhập ID cần sửa

    int id = int.parse(stdin.readLineSync()!); // Chuyển String -> int

    // Duyệt danh sách
    for (var product in productList) {
      if (product.id == id) {
        // Nếu tìm thấy product

        stdout.write("Enter new name: "); // Nhập tên mới

        product.name = stdin.readLineSync()!; // Cập nhật tên

        stdout.write("Enter new image: "); // Nhập image mới

        product.image = stdin.readLineSync()!; // Cập nhật image

        stdout.write("Enter new price: "); // Nhập giá mới

        product.price = double.parse(stdin.readLineSync()!); // Cập nhật giá

        print("Update success!"); // Thông báo thành công

        return; // Kết thúc hàm
      }
    }

    print("Product not found!"); // Không tìm thấy product
  }

  // Hàm tìm kiếm sản phẩm
  void searchProduct() {
    stdout.write("Enter keyword: "); // Nhập từ khóa

    String keyword = stdin
        .readLineSync()!
        .toLowerCase(); // Chuyển về chữ thường

    var result = productList
        .where(
      // where() dùng để lọc dữ liệu
          (product) => product.name.toLowerCase().contains(
        keyword,
      ), // contains() kiểm tra keyword
    )
        .toList(); // Chuyển sang List

    if (result.isEmpty) {
      // Nếu không tìm thấy

      print("Not found!");

      return;
    }

    printHeader(); // In header

    // Duyệt danh sách kết quả
    for (var product in result) {
      printProduct(product); // In product
    }

    print(
      "=================================================================",
    ); // In cuối bảng
  }

  // Hàm sắp xếp sản phẩm
  void sortProduct() {
    print("===== SORT MENU ====="); // Tiêu đề menu

    print("1. Price Ascending"); // Tăng dần

    print("2. Price Descending"); // Giảm dần

    stdout.write("Choose option: "); // Nhập lựa chọn

    int choice = int.parse(stdin.readLineSync()!); // Chuyển String -> int

    switch (choice) {
    // Kiểm tra lựa chọn

      case 1: // Sắp xếp tăng dần

        productList.sort(
          // sort() dùng để sắp xếp
              (a, b) => a.price.compareTo(b.price), // Nhỏ -> lớn
        );

        print("Sorted ascending!");

        break;

      case 2: // Sắp xếp giảm dần

        productList.sort(
              (a, b) => b.price.compareTo(a.price), // Lớn -> nhỏ
        );

        print("Sorted descending!");

        break;

      default: // Nếu nhập sai

        print("Invalid choice!");
    }
  }
}
