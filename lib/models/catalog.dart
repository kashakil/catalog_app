class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final products = [
  Item(
      id: 1,
      name: 'iPhone 12 pro',
      desc: 'Apple iPhone 12th generation',
      price: 999,
      color: '#33505a',
      image:
          'https://www.cnet.com/a/img/resize/14a512cf76c37bf0d1b5ee9570ce673fde903d10/hub/2020/11/09/5d16bee5-f1a5-45e1-b04a-a0d3dbdbefa7/p1003066-1.jpg?auto=webp&fit=crop&height=675&width=1200')
];
