List<Category> categories = [
  //income
  Category('เงินเดือน', false),
  Category('ค่าขนม', false),
  Category('ได้ฟรี', false),
  Category('ได้จากการลงทุน', false),
  Category('ได้จากวันเกิด', false),
  //expense
  Category('ค่าอาหาร', true),
  Category('ค่าเดินทาง', true),
  Category('ค่าที่พัก', true),
  Category('ของใช้', true),
  Category('ค่าบริการ', true),
  Category('ให้ยืม', true),
  Category('ให้คืน', true),
  Category('ค่ารักษา', true),
  Category('สัตว์เลี้ยง', true),
  Category('บริจาค', true),
  Category('แฟน', true),
  Category('เสื้อผ้า', true),
  Category('ค่าโทรศัพท์รายเดือน', true),
  Category('ลงทุน', true),
  Category('สนอง Need', true),
];

class Category {
  String label;
  bool isExpense;

  Category(this.label, this.isExpense);
}

class Transaction {
  Category category;
  double amount;
  String note;
  DateTime dateTime;

  Transaction(this.category, this.amount, this.note, this.dateTime);
}
