part of 'pages.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> _myItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: "Cart",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: "My Order",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  final List<Widget> _myPages = [
    HomePage(),
    CartPage(),
    OrderPage(),
    ProfilePage()
  ];
  final MainPageController mainPageController = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff3A5EA9), Color(0xff5365D0)])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: const Color(0xffA8B2E4),
              title: Row(
                children: [
                  Image.asset(
                    "assets/profile-image.png",
                    width: 50,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Halo, Storivers",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Cari Buku Cerita Kesukaanmu",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            body: _myPages.elementAt(controller.tabIndex),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xffA8B2E4),
              selectedItemColor: Color(0xff3C4D8D),
              unselectedItemColor: Colors.black,
              currentIndex: controller.tabIndex,
              items: _myItem,
              onTap: controller.changeTabIndex,
            ),
          ),
        );
      },
    );
  }
}
