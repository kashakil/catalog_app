class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: 'iPhone 12 pro',
        desc: 'Apple iPhone 12th generation',
        price: 999,
        color: '#33505a',
        image:
            'https://cdn.dxomark.com/wp-content/uploads/medias/post-61584/iphone-12-pro-max-graphite-hero.jpg'),
  ];
}

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

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map['id'],
        name: map['name'],
        desc: map['desc'],
        price: map['price'],
        color: map['color'],
        image: map['image']);
  }
  toMap() => {
        'id': id,
        'name': name,
        'desc': desc,
        'price': price,
        'color': color,
        'image': image,
      };
}
