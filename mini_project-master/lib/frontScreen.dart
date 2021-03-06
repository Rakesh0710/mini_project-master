import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/detailsPage.dart';
import 'Services.dart';
import 'UnescoSite.dart';
import 'homeScreen.dart';

class FrontScreen extends StatefulWidget {
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  List<UnescoSite> unescoSites = [];
  List<UnescoSite> filteredSites = [];

  List<FrontSites> editorsSites = [
    FrontSites(
      name: 'Dolomite',
      location: 'Italy',
      imageUrl: 'assets/dolamites.jpg',
      fact: 'They Were The Site Of Some Of World War I’s Fiercest Battles',
      idNumber: '1237',
    ),
    FrontSites(
      name: 'Ajantha Caves',
      location: 'India',
      imageUrl: 'assets/Ajantha_Caves.jpg',
      idNumber: '242',
      fact:
          'Though the caves are over 2,000 years old, the Buddha statues had been added close 600 years later.',
    ),
    FrontSites(
      name: 'Great Barrier Reef',
      location: 'Australia',
      imageUrl: 'assets/Greatbarrierreef.jpg',
      idNumber: '154',
      fact:
          ' It’s the only place on earth where two UNESCO World Heritage Sites meet. ',
    ),
    // FrontSites(
    //   name: 'Mecca Masjid',
    //   location: 'Saudi Arabia',
    //   imageUrl: 'assets/mecca.jpg',
    //   idNumber: '154',
    //   fact: 'The Great Mosque is the largest mosque and the eighth largest building in the world ',

    FrontSites(
      name: 'Mount Fuji',
      location: 'Japan',
      imageUrl: 'assets/Mount_Fuiji.jpg',
      idNumber: '1418',
      fact: 'MT FUJI IS ACTUALLY A STRATOVOLCANO! ',
    ),
    FrontSites(
      name: 'Stonehenge',
      location: 'England',
      imageUrl: 'assets/Stonehenge.jpg',
      idNumber: '373',
      fact: 'IN ITS EARLY DAYS, STONEHENGE WAS A CEMETERY.  ',
    ),
    FrontSites(
      name: 'Grand Canyon',
      location: 'United States',
      imageUrl: 'assets/GrandCanyon.jpg',
      idNumber: '1094',
      fact: 'MT FUJI IS ACTUALLY A STRATOVOLCANO! ',
    ),
    FrontSites(
      name: 'Acropolis of Athens',
      location: 'Greece',
      imageUrl: 'assets/Acroplis-Athens.jpg',
      idNumber: '404',
      fact: 'THE WORLD’S OLDEST WEATHER STATION IS AT ITS BASE.',
    ),
    FrontSites(
      name: 'Himeji Castle',
      location: 'Japan',
      imageUrl: 'assets/Himejicastle.jpg',
      idNumber: '661',
      fact:
          'For over 400 years, Himeji Castle has remained intact, even throughout the extensive bombing of Himeji in World War II and natural disasters such as the 1995 Great Hanshin earthquake and various typhoons',
    ),
  ];

  List<FrontSites> sevenWonders = [
    FrontSites(
      name: 'Taj Mahal',
      location: 'India',
      imageUrl: 'assets/Tajmahal.jpg',
      fact:
          'The tomb contains 99 different names of Allah as calligraphic inscriptions',
      idNumber: '252',
    ),
    FrontSites(
      name: 'Great Wall Of China',
      location: 'China',
      imageUrl: 'assets/Thegreatwallofchina.jpg',
      idNumber: '438',
      fact:
          'During the Cultural Revolution (1966–1976), many Great Wall bricks were used in building homes, farms, or reservoirs.',
    ),
    FrontSites(
      name: 'Machu Picchu',
      location: 'Peru',
      imageUrl: 'assets/Machupichu.jpg',
      idNumber: '274',
      fact:
          'Machu Picchu is made up of more than 150 buildings ranging from baths and houses to temples and sanctuaries. ',
    ),
    FrontSites(
      name: 'Chichen Itza',
      location: 'Mexico',
      imageUrl: 'assets/Chichenitza.jpg',
      idNumber: '483',
      fact:
          'It is believed Itza means water magicians, deriving from the Mayan Itz for magic and a for water ',
    ),
    FrontSites(
      name: 'Colosseum',
      location: 'Rome',
      imageUrl: 'assets/ColosseumRome.jpg',
      idNumber: '91',
      fact:
          'The arena had 36 trap doors for special effects, as well as many underground passages and rooms to hold wild animals and gladiators before the games began ',
    ),
    FrontSites(
      name: 'Petra',
      location: 'Jordan',
      imageUrl: 'assets/Petra.jpg',
      idNumber: '326',
      fact:
          'A Swiss explorer called Johann Ludwig Burckhardt discovered Petra in 1812. Because it was an unknown metropolitan for around 5 centuries, it is also called the ‘Lost City’.',
    ),
    FrontSites(
      name: 'Christ The Redemeer',
      location: 'Brazil',
      imageUrl: 'assets/christredemeer.jpg',
      idNumber: '1100',
      fact:
          ' The original design of the statue was different to what we see today. It was intended for Christ to be holding a globe in one hand and a cross in the other, rather than two open arms. ',
    ),
  ];

  void initState() {
    super.initState();
    Services.getUnescoSites().then((sites) {
      setState(() {
        unescoSites = sites;
        // filteredSites = unescoSites;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About App',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.redAccent[400],
        elevation: 0,
        title: Text(
          'Virtual Tourist Guide',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ListScreen(
                unescoSites: unescoSites,
              ),
            ),
          );
        },
        label: Text(
          'All Sites',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.location_city, color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FrontScreenSlider(
              editorsSites: editorsSites,
              unescoSites: unescoSites,
              title: 'Editor\'s Pics:',
            ),
            FrontScreenSlider(
              editorsSites: sevenWonders,
              unescoSites: unescoSites,
              title: 'Rakesh\'s Pics:',
            ),
            FrontScreenSlider(
              editorsSites: editorsSites,
              unescoSites: unescoSites,
              title: 'Govind\'s Pics:',
            ),
          ],
        ),
      ),
    );
  }
}

class FrontScreenSlider extends StatelessWidget {
  const FrontScreenSlider({
    Key key,
    @required this.editorsSites,
    this.title,
    this.unescoSites,
  }) : super(key: key);

  final List<FrontSites> editorsSites;
  final List<UnescoSite> unescoSites;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 230,
              // autoPlay: true,
            ),
            items: editorsSites
                .map(
                  (e) => Builder(builder: (context) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) {
                            return DetailsPage(
                              unescoSite: unescoSites
                                  .where((site) => site.idNumber == e.idNumber)
                                  .first,
                            );
                          }),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        // padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              bottom: 5,
                              child: Container(
                                height: 55.0,
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 15),
                                  child: RichText(
                                    text: TextSpan(
                                      text: e.name + ', ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: e.location,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    // style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            PhysicalModel(
                              clipBehavior: Clip.hardEdge,
                              color: Colors.black,
                              shadowColor: Colors.grey,
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    height: 175.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    image: AssetImage(e.imageUrl),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class FrontSites {
  String name;
  String location;
  String fact;
  String imageUrl;
  String idNumber;

  FrontSites({
    this.name,
    this.location,
    this.fact,
    this.imageUrl,
    this.idNumber,
  });
}
