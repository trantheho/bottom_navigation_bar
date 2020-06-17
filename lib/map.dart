import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'model.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MapScreen(),
    );
  }
}


class _MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<_MapScreen> {
  static const LatLng _center = const LatLng(10.8018416, 106.6549777);

  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coffeeShops.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.shopName),
          draggable: false,
          infoWindow:
          InfoWindow(title: element.shopName, snippet: element.address),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _coffeeShopList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            //moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    height: 125.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white),
                        child: Row(children: [
                          Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          coffeeShops[index].thumbNail),
                                      fit: BoxFit.cover))),
                          SizedBox(width: 5.0),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coffeeShops[index].shopName,
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  coffeeShops[index].address,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    coffeeShops[index].description,
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ])
                        ]))))
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps'),
          backgroundColor: Color.fromRGBO(0, 153, 153, 1),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: MediaQuery.of(context).size.height - 50.0,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 12.0,
                      bearing: 45.0,
                      tilt: 45.0,
                  ),
                  markers: Set.from(allMarkers),
                  onMapCreated: mapCreated,
                  circles: circles,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: coffeeShops.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _coffeeShopList(index);
                  },
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 36,
              right: 36,
              child: Container(
                height: 79.0,
                width: 350,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(254, 254, 254, 1),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500],
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Nhập ngành nghề bạn muốn tìm',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      color: Colors.grey,
                      height: 1,
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Nhập vị trí tìm',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          ],
        ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: coffeeShops[_pageController.page.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }

  Set<Circle> circles = Set.from([
    Circle(
    circleId: CircleId('1'),
    center:_center,
    radius: 1800,
    fillColor: Color.fromRGBO(0, 153, 153, 1).withOpacity(0.1),
    strokeColor: Colors.transparent,
  ),
    Circle(
      circleId: CircleId('1'),
      center:_center,
      radius: 1600,
      fillColor: Color.fromRGBO(0, 153, 153, 1).withOpacity(0.2),
      strokeColor: Colors.transparent,
    )
  ]);

}
