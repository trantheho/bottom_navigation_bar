import 'package:google_maps_flutter/google_maps_flutter.dart';

class Coffee {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Coffee(
      {this.shopName,
        this.address,
        this.description,
        this.thumbNail,
        this.locationCoords});
}

final List<Coffee> coffeeShops = [
  Coffee(
      shopName: 'Phúc Long Coffee',
      address: 'Tầng 1 Republic Plaza',
      description:
      'Thức uống thơm ngon hảo hạn. Điểm đến của sự sang chảnh',
      locationCoords: LatLng(10.8018416, 106.6549777),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'
  ),
  Coffee(
      shopName: 'CGV Hoàng Văn Thụ',
      address: '463 7th Ave',
      description:
      'All-day American comfort eats in a basic diner-style setting',
      locationCoords: LatLng(10.8018416, 106.6549777),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'
  ),
  Coffee(
      shopName: 'Chợ Hoàng Hoa Thám',
      address: '240 Sullivan St',
      description:
      'Small spot draws serious caffeine lovers with',
      locationCoords: LatLng(10.8018416, 106.6549777),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'
  ),
  Coffee(
      shopName: 'Tin Học Ngôi Sao',
      address: '214 E 10th St',
      description:
      'Snazzy, compact Japanese cafe showcasing high-end coffee',
      locationCoords: LatLng(10.8018416, 106.6549777),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'
  ),
  Coffee(
      shopName: 'Lotte Cộng Hòa',
      address: '301 W Broadway',
      description:
      'Compact coffee & espresso bar turning out drinks',
      locationCoords: LatLng(10.8018416, 106.6549777),
      thumbNail: 'https://lh5.googleusercontent.com/p/AF1QipOMNvnrTlesBJwUcVVFBqVF-KnMVlJMi7_uU6lZ=w90-h90-n-k-no'
  )
];