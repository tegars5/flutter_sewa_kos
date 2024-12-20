import 'package:flutter/material.dart';
import 'package:project_app/pages/models/city.dart';
import 'package:project_app/pages/models/space.dart';
import 'package:project_app/pages/models/tips.dart';
import 'package:project_app/pages/widgets/buttom_navbar_item.dart';
import 'package:project_app/pages/widgets/city_card.dart';
import 'package:project_app/pages/widgets/space_card.dart';
import 'package:project_app/pages/widgets/tips_card.dart';
import 'package:project_app/providers/space_provider.dart';
import 'package:project_app/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                "Explore Now",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                "Mencari kosan yang cozy",
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //Popular Cities
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                "Popular Cities",
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: "Jakarta",
                      imageUrl: "assets/images/jakarta.png",
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: "Bandung",
                      imageUrl: "assets/images/bandung.png",
                      isPopular: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: "Surabaya",
                      imageUrl: "assets/images/surabaya.png",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: "palembang",
                      imageUrl: "assets/images/palembang.png",
                      isPopular: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 5,
                      name: "Aceh",
                      imageUrl: "assets/images/aceh.png",
                      isPopular: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 6,
                      name: "Bogor",
                      imageUrl: "assets/images/bogor.png",
                      isPopular: false,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                "Recommended Space",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data as List<Space>;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                "Tips & Guidance",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      name: "City Guidelines",
                      updated: "20 Apr",
                      imageUrl: "assets/images/tips1.png",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      name: "Jakarta Fairship",
                      updated: "11 Dec",
                      imageUrl: "assets/images/tips2.png",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: "assets/images/icon_home_solid.png",
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_mail_solid.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_card_solid.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/images/icon_love_solid.png",
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
