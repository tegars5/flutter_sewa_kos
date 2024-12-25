import 'package:flutter/material.dart';
import 'package:project_app/pages/erorr_page.dart';
import 'package:project_app/pages/models/space.dart';
import 'package:project_app/pages/widgets/facility_item.dart';
import 'package:project_app/pages/widgets/wishlist_button.dart';
import 'package:project_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.space, {super.key});

  final Space space;

  @override
  Widget build(BuildContext context) {
    void launchErrorPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ErorrPage(),
        ),
      );
    }

    Future<void> showCallConfirmationDialog(String phoneNumber) async {
      final result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Konfirmasi"),
            content: const Text("Apakah anda yakin ingin menelpon ibu kos?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Tidak setuju
                },
                child: const Text("Tidak"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Setuju
                },
                child: const Text("Iya"),
              ),
            ],
          );
        },
      );

      if (result == true) {
        final uri = Uri.parse('tel:$phoneNumber');
        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        } else {
          launchErrorPage();
        }
      } else {
        launchErrorPage();
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style: blueTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "/month",
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Row(
                              children: List.generate(
                                5,
                                (index) => Image.asset(
                                  index < space.rating
                                      ? 'assets/images/icon_star_solid.png'
                                      : 'assets/images/icon_star_black.png',
                                  width: 20,
                                ),
                              ),
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
                          "Main Facilities",
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'Kitchen',
                              imageUrl: 'assets/images/icon_kichen.png',
                              total: space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'Bedroom',
                              imageUrl: 'assets/images/icon_bed.png',
                              total: space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'Big lemari',
                              imageUrl: 'assets/images/icon_lemari.png',
                              total: space.numberOfCupboards,
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
                          "Photos",
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(left: edge),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: item.isNotEmpty
                                    ? Image.network(
                                        item,
                                        width: 110,
                                        height: 88,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            width: 110,
                                            height: 88,
                                            color: Colors.grey,
                                            child: const Icon(
                                                Icons.broken_image,
                                                color: Colors.white),
                                          );
                                        },
                                      )
                                    : Container(
                                        width: 110,
                                        height: 88,
                                        color: Colors.grey,
                                        child: const Icon(
                                            Icons.image_not_supported,
                                            color: Colors.white),
                                      ),
                              ),
                            );
                          }).toList(),
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
                          "Location",
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                final uri = Uri.parse(space.mapUrl);
                                launchUrl(uri);
                              },
                              child: Image.asset(
                                'assets/images/icon_map.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          onPressed: () {
                            showCallConfirmationDialog(space.phone);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          child: Text(
                            "Book Now",
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  const InkWell(
                    child: WishlistButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
