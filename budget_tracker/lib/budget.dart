class Budget {
  String item;
  int amount;
  Budget({required this.amount, required this.item});
}

class val {
  List<int> amount;
  List<Budget> items;
  val({required this.amount, required this.items});
}
