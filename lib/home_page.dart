import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tourist_spot_app/places.dart';
import 'constant.dart';


class Homepage extends StatelessWidget {
  Homepage({super.key});

  // List of places
  final List<Map<String, dynamic>> places = [
    {
      "name": place1Name,
      "image": image1,
      "description": description1,
    },
    {
      "name": place2Name,
      "image": image2,
      "description": description2,
    },
    {
      "name": place3Name,
      "image": image3,
      "description": description3,
    },
    {
      "name": place4Name,
      "image": image4,
      "description": description4,
    },
    {
      "name": place5Name,
      "image": image5,
      "description": description5,
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          "The places",
          style: GoogleFonts.acme(color: Colors.white),
        ),
      ),


      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: places.map((place) => buildPlaceCard(context, place)).toList(),
      ),
    );
  }

  Widget buildPlaceCard(BuildContext context, Map<String, dynamic> place) {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(msg: place["name"]);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Places(
              name: place["name"],
              image: place["image"],
              description: place["description"],
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        color: Colors.purpleAccent[200],
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15), // Rounded corners for the image
                child: Image.asset(
                  "assets/images/${place['image']}", // Load image dynamically
                  width: 400,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                place["name"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


