class Hotel{
  String? destination;
  String? image;
  String? place;
  int? price;

  Hotel({this.destination, this.image, this.place, this.price});

  factory Hotel.fromMap(map){
    return Hotel(
      destination: map['destination'],
      image: map['image'],
      place: map['place'],
      price: map['price'],
    );
  }

}

class Ticket{
  From from;
  To to;
  String? date;
  String? departure_time;
  String? flying_time;
  int? number;

  Ticket({required this.from, required this.to, this.date, this.departure_time, this.flying_time, this.number});

  factory Ticket.fromMap(map){
    return Ticket(
      from: From.fromMap(map["from"]),
      to: To.fromMap(map["to"]),
      date: map['date'],
      departure_time: map['departure_time'],
      flying_time: map['flying_time'],
      number: map['number']
    );
  }
}

class From{
  String? code;
  String? name;

  From({this.code, this.name});

  factory From.fromMap(map){
    return From(
      code: map['code'],
      name: map['name']
    );
  }
}

class To{
  String? code;
  String? name;

  To({this.code, this.name});

  factory To.fromMap(map){
    return To(
        code: map['code'],
        name: map['name']
    );
  }
}