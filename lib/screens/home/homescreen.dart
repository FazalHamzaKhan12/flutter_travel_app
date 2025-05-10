import 'package:flutter/material.dart';
import 'package:travelapp_ui/screens/pic_template.dart';
import 'package:travelapp_ui/utilities/fitlerbutton.dart';
import 'package:travelapp_ui/utilities/picturetemplate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> places = [
    {
      "mountainName": "K2",
      "cityLocation": ", Karakoram",
      "countryName": "Karakoram, Pakistan",
      "rating": "4.9",
      "linkPic":
          "https://epicexpeditions.co/wp-content/uploads/2022/09/k2_base_camp_trek11.jpg",
      "isFavorite": false,
    },
    {
      "mountainName": "Mount Fuji",
      "cityLocation": ", Tokyo",
      "countryName": "Tokyo, Japan",
      "rating": "4.8",
      "linkPic":
          "https://www.agoda.com/wp-content/uploads/2024/02/Featured-image-Mount-Fuji-from-Shizuoka-Japan.jpg",
      "isFavorite": false,
    },
    {
      "mountainName": "Everest",
      "cityLocation": ", Himalayas",
      "countryName": "Himalayas, Nepal",
      "rating": "4.5",
      "linkPic":
          "https://plus.unsplash.com/premium_photo-1688645554172-d3aef5f837ce?fm=jpg&q=60&w=3000",
      "isFavorite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 26),
                      child: Text(
                        "Hi, David 👋",
                        style: TextStyle(
                          color: Color(0xff2F2F2F),
                          fontSize: 27,
                          fontFamily: 'Montserrats',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 220.0, top: 30),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUpeorPvZN_kz2u_YMpnlcw5sdu2OfQKZ8NQ&s",
                        ),
                        radius: 26,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 295.0),
                  child: Text(
                    "Explore the world",
                    style: TextStyle(
                      color: Color(0xff888888),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 14),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search places',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 1,
                    color: Colors.grey.shade400,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  Icon(Icons.tune, color: Colors.grey.shade600),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22.0, top: 20),
                child: Text(
                  "Popular places",
                  style: TextStyle(
                    color: Color(0xff2F2F2F),
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 220.0, top: 20),
                child: Text(
                  "View all",
                  style: TextStyle(
                    color: Color(0xff888888),
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterButton(title: 'Most Viewed', isSelected: true),
                  SizedBox(width: 15),
                  FilterButton(title: 'Nearby', isSelected: false),
                  SizedBox(width: 15),
                  FilterButton(title: 'Latest', isSelected: false),
                  SizedBox(width: 15),
                  FilterButton(title: 'Trending', isSelected: false),
                  SizedBox(width: 15),
                  FilterButton(title: 'New Added', isSelected: false),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(places.length, (index) {
                final place = places[index];
                return Row(
                  children: [
                    GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PicTemplate(place: place),
                            ),
                          ),
                      child: PictureContainer(
                        mountainName: place["mountainName"],
                        cityLocation: place["cityLocation"],
                        countryName: place["countryName"],
                        rating: place["rating"],
                        linkPic: place["linkPic"],
                        isFavorite: place["isFavorite"],
                        onToggleFavorite: () {
                          setState(() {
                            places[index]["isFavorite"] =
                                !places[index]["isFavorite"];
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 25),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
