import 'dart:io'; // Thư viện hỗ trợ nhập xuất dữ liệu console

import 'manager/productmanager.dart'; // Import class ProductManager

// Hàm main() là điểm bắt đầu chương trình
void main() {
  // Tạo object manager để gọi các hàm quản lý sản phẩm
  ProductManager manager = ProductManager();

  // while(true) dùng để chạy menu liên tục
  while (true) {
    // In menu chương trình
    print("\n=========== PRODUCT MENU ===========");

    print("1. Add Product"); // Thêm sản phẩm

    print("2. Show Product"); // Hiển thị sản phẩm

    print("3. Update Product"); // Cập nhật sản phẩm

    print("4. Delete Product"); // Xóa sản phẩm

    print("5. Search Product"); // Tìm kiếm sản phẩm

    print("6. Sort Product By Price"); // Sắp xếp sản phẩm

    print("0. Exit"); // Thoát chương trình

    // Yêu cầu người dùng nhập lựa chọn
    stdout.write("Choose: ");

    // Đọc dữ liệu từ bàn phím
    // int.parse() chuyển String -> int
    int choice = int.parse(stdin.readLineSync()!);

    // switch dùng để kiểm tra nhiều trường hợp
    switch (choice) {
    // Case 1: Thêm sản phẩm
      case 1:
        manager.addProduct(); // Gọi hàm thêm

        break; // Thoát case

    // Case 2: Hiển thị sản phẩm
      case 2:
        manager.showProducts(); // Gọi hàm hiển thị

        break;

    // Case 3: Cập nhật sản phẩm
      case 3:
        manager.updateProduct(); // Gọi hàm update

        break;

    // Case 4: Xóa sản phẩm
      case 4:
        manager.deleteProduct(); // Gọi hàm xóa

        break;

    // Case 5: Tìm kiếm sản phẩm
      case 5:
        manager.searchProduct(); // Gọi hàm tìm kiếm

        break;

    // Case 6: Sắp xếp sản phẩm
      case 6:
        manager.sortProduct(); // Gọi hàm sắp xếp

        break;

    // Case 0: Thoát chương trình
      case 0:
        print("Exit program!"); // Thông báo thoát

        return; // Kết thúc chương trình

    // Nếu nhập sai
      default:
        print("Invalid choice!"); // Báo lỗi
    }
  }
}
