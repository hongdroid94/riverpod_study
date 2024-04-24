import 'package:flutter/material.dart';
import 'package:riverpod_study/repositories/hotel_repository.dart';

import '../constants/gaps.dart';
import '../models/hotel.dart';

class HotelListPage extends StatefulWidget {
  const HotelListPage({super.key});

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  List<Hotel> hotels = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _fetchHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      body: Center(
        child: loading ? const CircularProgressIndicator() : buildHotels(),
      ),
    );
  }

  Future _fetchHotels() async {
    hotels = await fetchHotels();

    setState(() {
      loading = false;
    });
  }

  Widget buildHotels() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final Hotel hotel = hotels[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'name: ${hotel.name}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v2,
              Text(
                'classification: ${hotel.classification}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Gaps.v2,
              Text(
                'city: ${hotel.city}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Gaps.v2,
              Text(
                'parking: ${hotel.parkingLotCapacity ?? "NA"}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Gaps.v10,
              const Divider(
                color: Colors.grey,
              ),
              if (hotel.reviews.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Be the first reviewer',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              if (hotel.reviews.isNotEmpty)
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Review review = hotel.reviews[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${review.score}'),
                      ),
                      title: Text(review.review ?? 'No written Review'),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey,
                    );
                  },
                  itemCount: hotel.reviews.length,
                ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            thickness: 2,
          );
        },
        itemCount: hotels.length,
      ),
    );
  }
}
