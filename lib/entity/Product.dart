import 'dart:io'; // Import thư viện nhập xuất dữ liệu

// Class Product dùng để tạo đối tượng sản phẩm
class Product {
  int id; // Thuộc tính lưu ID sản phẩm

  String name; // Thuộc tính lưu tên sản phẩm

  String image; // Thuộc tính lưu tên ảnh sản phẩm

  double price; // Thuộc tính lưu giá sản phẩm

  // Constructor dùng để khởi tạo object Product
  Product({
    required this.id, // Bắt buộc nhập ID

    required this.name, // Bắt buộc nhập tên

    required this.image, // Bắt buộc nhập image

    required this.price, // Bắt buộc nhập giá
  });
}
