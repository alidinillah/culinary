
import 'package:culinary/models/products.dart';
import 'package:flutter/material.dart';

class CartNotifier extends ChangeNotifier {
  List<Cart> carts = List<Cart>();
  // CartNotifier() : carts = [];
  bool found = false;
  

  addProduct(Product product) {
    Cart c = Cart(product, 1);
    if(c.product.id == product.id) {
      c.quantity = ++c.quantity - 1;
    }
    carts.add(c);
    notifyListeners();
  }

  // addProduct(Product product) {
  //   for(int i = 0; i >= carts.length; i++) {
  //     Cart c = carts[i];
  //     if (c.product.id == product.id) {
  //       c.quantity = ++c.quantity;
  //       found = true;
  //       break;
  //     } 
  //   }
  //   if(!found) carts.add(Cart(product, 1));
  //   notifyListeners();
  // }

  remove(Product product) {
    for (int i = 0; i < carts.length; i++) {
      Cart c = carts[i];
      if (c.product.id == product.id) {
        c.quantity = --c.quantity;
        if (c.quantity <= 0) carts.removeAt(i);
        break;
      }
    }
    notifyListeners();
  }

  removeProduct(Cart selectedCp) {
    carts.remove(selectedCp);
    notifyListeners();
  }

  cleanProduct() {
    carts = [];
    notifyListeners();
  }

  int get total => carts != null ? carts.length : 0;

  // addExpired(Cart selectedCp) {
  //   CartQuantity cq = CartQuantity(DateTime.now().millisecondsSinceEpoch, null, 0);
  //   selectedCp.cartQuantities.add(cq);
  //   notifyListeners();
  // }

  // removeExpired(CartQuantity expiredQuantity) {
  //   for (int i = 0; i < carts.length; i++) {
  //     Cart e = carts[i];
  //       e.cartQuantities.removeAt(i);
  //   }
  //   notifyListeners();
  // }

  Cart getCart (Product product) {
    Cart c;
    for (int i = 0; i < total; i++) {
      Cart cp = carts[i];
      if(cp.product.id == product.id) {
        c = cp;
        break;
      }
    }
    return c;
  }

  // setDate(Product product, int id, DateTime date) {
  //   Cart selectedCp = getCart(product);
  //   CartQuantity selectedCq;
  //   for (int i = 0; i < selectedCp.cartQuantities.length; i++) {
  //     CartQuantity eq = selectedCp.cartQuantities[i];
  //     if (eq.id == id) {
  //       selectedCq = eq;
  //       break;
  //     }
  //   }
  //   selectedCq.expired = date;
  //   notifyListeners();
  // }

  // setQuantity(Product product, int id, int quantity) {
  //   Cart selectedCp = getCart(product);
  //   CartQuantity selectedCq;
  //   for (int i = 0; i < selectedCp.cartQuantities.length; i++) {
  //     CartQuantity cq = selectedCp.cartQuantities[i];
  //     if (cq.id == id) {
  //       selectedCq = cq;
  //       break;
  //     }
  //   }
  //   selectedCq.quantity = quantity;
  //   notifyListeners();
  // }

  isExist(Product product) {
    Cart c = getCart(product);
    return c == null;
  }

int quantity(Product product) {
    for (int i = 0; i < carts.length; i++) {
      Cart c = carts[i];
      if (c.product.id == product.id) {
        return c.quantity;
      }
    }
    return 0;
  }

  int totalQuantity() {
    int total = 0;
    for (int i = 0; i < carts.length; i++) {
      Cart c = carts[i];
      total += c.quantity;
    }
    return total;
  }

  double totalPrice(List<Cart> carts) {
    double totalPrice = 0;
    for(int i = 0; i < carts.length; i++) {
      Cart c = carts[i];
      totalPrice += c.product.price * c.quantity;
    }
    return totalPrice;
  }
}

class Cart {
  Product product;
  int quantity;
  Cart(this.product, this.quantity); 
  
  factory Cart.init(Product product) => Cart(product, 0);
}

class CartQuantity {
  int id;
  DateTime expired;
  int quantity;
  CartQuantity(this.id, this.expired, this.quantity);

  factory CartQuantity.fromMap(Map<String, dynamic> map) => 
    CartQuantity(
      map["id"],
      DateTime.parse(map["expired"]),
      map["quantity"],
    );
}
