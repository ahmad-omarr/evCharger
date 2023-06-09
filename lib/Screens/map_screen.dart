import 'dart:async';
import 'package:evcharger/helpers/location_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  BitmapDescriptor chargerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor maintenanceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor carCareIcon = BitmapDescriptor.defaultMarker;
  TextEditingController searchController = TextEditingController();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  Position? _currentPosition;
  Set<Marker> markers = Set<Marker>();
  Set<Polyline> polylines = Set<Polyline>();
  int polylineIdCounter = 1;
  List<String> stationNames = [
    'Tesla Destination charger',
    'Electric Vehicle Charging Station',
    'Porsche Destination Charging Station',
    'AlManaseer Gas Station Wadi Saqra',
    'City Mall Tesla Destination Charger',
    'Kilani Center',
    'Habash Premium Tires & Oil Change',
    'Elite upgrade and auto parts',
    'Auto Excellence Parts Co BOSCH',
  ];
  String? selectedStation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    // Get the current position of the device
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
  }

  // Function to show the chargers icons
  void addchargerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/ev_station.png",
    ).then((icon) {
      setState(() {
        chargerIcon = icon;
        markers.addAll([
          Marker(
            markerId: MarkerId('station1'),
            position: LatLng(32.013391, 35.833273),
            icon: chargerIcon,
            infoWindow: InfoWindow(title: 'Tesla Destination charger'),
            onTap: () {
              // Show modal bottom sheet when marker is tapped
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Tesla Destination charger',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Center(
                              //add image in bottom sheet
                              child: Image.asset(
                                'assets/Tesla.png',
                                fit: BoxFit.fill,
                                width: 350,
                                height: 150,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'The Electric Vehicle Charging Station is a destination charger specifically designed to provide convenient and reliable charging for electric vehicles. This particular charger offers a charging capacity of 11 kW, allowing Tesla owners to recharge their vehicles efficiently while on the go. It utilizes AC (alternating current) charging technology, which is the standard charging method for most electric vehicles. AC charging allows for a straightforward and user-friendly charging process.',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Marker(
            markerId: MarkerId('station2'),
            position: LatLng(31.974568, 35.907999),
            icon: chargerIcon,
            infoWindow: InfoWindow(title: 'Electric Vehicle Charging Station'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Electric Vehicle Charging Station',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Center(
                              child: Image.asset(
                                'assets/chargestation.png',
                                fit: BoxFit.fill,
                                width: 350,
                                height: 150,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'The Tesla Destination Charger is an innovative charging solution designed specifically for Tesla electric vehicles. This particular charger offers a charging capacity of 22 kW, it utilizes AC (alternating current) charging technology, which is the standard charging method for most electric vehicles. AC charging allows for a convenient and straightforward charging process, typically through a Type 2 connector. This destination charger delivers a relatively fast charging experience.',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Marker(
            markerId: MarkerId('station3'),
            position: LatLng(31.936057, 35.891864),
            icon: chargerIcon,
            infoWindow:
            InfoWindow(title: 'Porsche Destination Charging Station'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Porsche Destination Charging Station',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Center(
                              child: Image.asset(
                                'assets/porsche.jpg',
                                fit: BoxFit.fill,
                                width: 350,
                                height: 150,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'The Porsche Destination Charging Station is a premium charging facility designed specifically for Porsche electric vehicles. This destination charging station provides a convenient and reliable charging solution for Porsche owners, allowing them to recharge their vehicles while enjoying various amenities and services. The Porsche Destination Charging Station is equipped with state-of-the-art charging infrastructure that utilizes DC charging technology. It is the standard charging method for most electric vehicles, including Porsche EVs. This charging station offers a power option of 22 kW, depending on the specific installation.',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Marker(
            markerId: MarkerId('station4'),
            position: LatLng(31.964275, 35.888430),
            icon: chargerIcon,
            infoWindow: InfoWindow(title: 'AlManaseer Gas Station Wadi Saqra'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'AlManaseer Gas Station Wadi Saqra',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Center(
                              child: Image.asset(
                                'assets/manaseer.png',
                                fit: BoxFit.fill,
                                width: 350,
                                height: 150,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'AlManaseer Gas Station in Wadi Saqra is not just your typical gas station but a forward-thinking establishment that recognizes the growing popularity of electric vehicles (EVs). Committed to providing comprehensive services to meet the diverse needs of motorists, AlManaseer Gas Station has taken a step towards sustainable transportation by offering EV charging facilities alongside traditional fuel services.  its commitment to sustainability and supporting the transition to greener transportation options. By embracing electric vehicle technology, the gas station is playing a crucial role in promoting eco-friendly practices and reducing carbon emissions in the community.',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Marker(
            markerId: MarkerId('station5'),
            position: LatLng(31.979676, 35.836962),
            icon: chargerIcon,
            infoWindow:
            InfoWindow(title: 'City Mall Tesla Destination Charger'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'City Mall Tesla Destination Charger',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Center(
                              child: Image.asset(
                                'assets/Tesla.png',
                                fit: BoxFit.fill,
                                width: 350,
                                height: 150,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'The Electric Vehicle Charging Station is a destination charger specifically designed to provide convenient and reliable charging for electric vehicles. This particular charger offers a charging capacity of 11 kW, allowing Tesla owners to recharge their vehicles efficiently while on the go. It utilizes AC (alternating current) charging technology, which is the standard charging method for most electric vehicles. AC charging allows for a straightforward and user-friendly charging process.',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ]);
      });
    });
  }

  void addMaintenanceIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/maint.png",
    ).then((icon) {
      setState(() {
        maintenanceIcon = icon;
        markers.addAll([
          Marker(
            markerId: MarkerId('Maintenance1'),
            position: LatLng(31.988765, 35.908917),
            icon: maintenanceIcon,
            infoWindow: InfoWindow(title: 'Kilani Center'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Kilani Center',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Center(
                              child: Image.asset(
                                'assets/kilani.jpg',
                                fit: BoxFit.fill,
                                width: 250,
                                height: 250,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'Kilani Center is a renowned automotive service center. With a strong reputation for excellence and reliability, Kilani Center offers a comprehensive range of tire services and vehicle inspections to meet the needs of car owners and drivers in the area. Whether you\'re in need of tire services, vehicle inspections, or general automotive maintenance, Kilani Center is the go-to destination for all your automotive needs. With their commitment to excellence, quality workmanship, and customer satisfaction, Kilani Center has established itself as a trusted and reliable partner for car owners.',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Marker(
            markerId: MarkerId('Maintenance2'),
            position: LatLng(31.992691, 35.889511),
            icon: maintenanceIcon,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Habash Premium Tires & Oil Change',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        //SizedBox(height: 2.0),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Center(
                              child: Image.asset(
                                'assets/habash.jpg',
                                width: 450,
                                height: 600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            'Habash Premium Tires & Oil Change is a premier automotive service center. As a trusted name in the industry, Habash Premium offers a wide range of tire services and oil change solutions to cater to the needs of car owners and drivers in the area.As a customer-centric establishment, Habash Premium aims to make your experience seamless and convenient. They offer competitive pricing, transparent service recommendations, and efficient turnaround times to minimize any disruptions to your busy schedule. By choosing Habash Premium for your tire and oil change needs, you can rest assured that your vehicle will receive top-quality care from a trusted automotive service provider.',
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ]);
      });
    });
  }

  void addCarPartsIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "assets/carparts.png",
    ).then((icon) {
      setState(() {
        carCareIcon = icon;
        markers.addAll([
          Marker(
            markerId: MarkerId('CarCare1'),
            position: LatLng(31.939457, 35.839911),
            icon: carCareIcon,
            infoWindow: InfoWindow(
              title: 'Elite upgrade and auto parts',
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Elite upgrade and auto parts',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        //SizedBox(height: 2.0),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Center(
                              child: Image.asset(
                                'assets/elite.png',
                                width: 450,
                                height: 600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            'Elite Upgrade and Auto Parts is your premier destination for all things automotive. Located in a convenient and easily accessible location, we cater to car enthusiasts, professionals, and everyday drivers who are passionate about their vehicles. If you\'re in need of installation services, our skilled technicians are available to professionally fit your chosen parts and upgrades, ensuring proper installation and optimal functionality. We strive for excellence in every aspect of our operations, delivering outstanding results that exceed customer expectations.',
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Marker(
            markerId: MarkerId('CarCare2'),
            position: LatLng(31.922626, 35.941349),
            icon: carCareIcon,
            infoWindow: InfoWindow(title: 'Auto Excellence Parts Co BOSCH'),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Auto Excellence Parts Co BOSCH',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        //SizedBox(height: 2.0),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Center(
                              child: Image.asset(
                                'assets/auto.png',
                                width: 450,
                                height: 600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            'Auto Excellence Parts Co is a reputable and reliable automotive shop specializing in providing a wide range of high-quality parts and accessories, with a particular emphasis on BOSCH products. With a strong commitment to excellence, this shop has established itself as a trusted destination for automotive enthusiasts and professionals alike. Auto Excellence Parts Co has built a solid reputation as a trusted destination for BOSCH parts, catering to the needs of automotive enthusiasts, mechanics, and professionals in the industry. Their commitment to offering top-notch products, knowledgeable staff, and excellent customer service sets them apart as a premier shop for all your BOSCH automotive part requirements.',
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ]);
      });
    });
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    addchargerIcon();
    addMaintenanceIcon();
    addCarPartsIcon();
    if (_currentPosition != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
            LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            zoom: 15,
          ),
        ),
      );
    }
  }

  Future<void> goToPlace(String? stationName) async {
    // Find the selected station using its name
    Marker? selectedMarker = markers.firstWhere(
          (Marker marker) => marker.infoWindow.title == stationName,
    );

    if (selectedMarker != null) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: selectedMarker.position, zoom: 12),
        ),
      );
    }
  }

  Future<void> goToDirection(double lat,
      double lng,
      Map<String, dynamic>? boundsNe,
      Map<String, dynamic>? boundsSw,) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );

    if (boundsNe != null && boundsSw != null) {
      controller.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              boundsSw['lat']!.toDouble(),
              boundsSw['lng']!.toDouble(),
            ),
            northeast: LatLng(
              boundsNe['lat']!.toDouble(),
              boundsNe['lng']!.toDouble(),
            ),
          ),
          25,
        ),
      );
    }
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.953964, 35.910583),
    zoom: 12,
  );

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$polylineIdCounter';
    polylineIdCounter++;
    polylines.add(Polyline(
      polylineId: PolylineId(polylineIdVal),
      width: 2,
      color: Colors.blue,
      points: points
          .map(
            (point) => LatLng(point.latitude, point.longitude),
      )
          .toList(),
    ));
  }

  bool showListView = false;

  @override
  Widget build(BuildContext context) {
    // Filter the station names based on the selected station
    List<String> filteredStationNames = stationNames.where((name) {
      return name.toLowerCase().contains(selectedStation?.toLowerCase() ?? '');
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Google maps"),
        leading: Container(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              onTap: () {
                // Show modal bottom sheet for station selection
                showModalBottomSheet(
                  context: context,
                  builder: (builder) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: filteredStationNames.length,
                        itemBuilder: (context, index) {
                          final station = filteredStationNames[index];
                          return ListTile(
                            title: Text(station),
                            onTap: () {
                              setState(() {
                                selectedStation = station;
                                searchController.text = station;
                              });
                              goToPlace(station);
                              Navigator.pop(context); // Close the modal
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  selectedStation = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Add some spacing between the row and text fields
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 15, right: 15),
                  child: TextFormField(
                    controller: _originController,
                    decoration: InputDecoration(
                      labelText: 'Destination from',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10), // Add spacing between the text fields
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 15, right: 15),
                  child: TextFormField(
                    controller: _destinationController,
                    decoration: InputDecoration(
                      labelText: 'Destination to',
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  var directions = await LocationService()
                      .getDirections( // Get directions and update the map
                    _originController.text,
                    _destinationController.text,
                  );
                  goToDirection(
                    directions['start_location']['lat'],
                    directions['start_location']['lng'],
                    directions['bounds_ne'],
                    directions['bounds_sw'],
                  );
                  _setPolyline(directions['polyline_decoded']);
                  setState(() {}); // Add this line to update the map state
                },
                icon: Icon(Icons.route_outlined),
              ),
            ],
          ),
          Expanded(
            //call the google maps built in function
            child: GoogleMap(
              polylines: polylines,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              onMapCreated: onMapCreated,
              markers: markers,
            ),
          ),
        ],
      ),
    );
  }
}