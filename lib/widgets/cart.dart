class CartItem {
  final String name;
  final int buttonValue;
  final int rent;
  int totalValue;

  CartItem(this.name, this.buttonValue, this.rent, this.totalValue);

  int calculateTotalValue() {
    if (name == "Helmet") {
      totalValue = buttonValue * rent + 800;
    } else if (name == "Riding Gloves") {
      totalValue = buttonValue * rent;
    } else if (name == "Riding Jacket") {
      totalValue = buttonValue * rent + 1500;
    }
    return totalValue;
  }
}

List<CartItem> cartItems = [];