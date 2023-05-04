import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);
    super.initState();
  }

  _handleTabSection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 66, 63, 63),
        child: ListView(
          children: const <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 17, 16, 16)),
              accountName: Text('Mukesh Mandal'),
              accountEmail: Text('Mukeshm98149@gmail.com'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://marketplace.canva.com/EAFEits4-uw/1/0/800w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-r0bPCSjUqg0.jpg')),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Movies Streaming"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              for (int i = 1; i < 7; i++)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: AssetImage('assets/images/$i.jpg'),
                          fit: BoxFit.fill)),
                )
            ],
            options: CarouselOptions(
              autoPlay: true,
              height: 230,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            isScrollable: true,
            indicator: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(left: 10),
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Action"),
              Tab(text: "Adventure"),
              Tab(text: "Comedy"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AllMoviesCat(size: size, tabController: _tabController)
        ],
      ),
    );
  }
}

class AllMoviesCat extends StatelessWidget {
  const AllMoviesCat({
    super.key,
    required this.size,
    required TabController tabController,
  }) : _tabController = tabController;

  final Size size;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return [
      Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                for (int i = 0; i <= 10; i++)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 150,
                          width: 200,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT51PmG3rnbwieDSFbEyXaf7CoA-FvV7qSnZSGWvk0dH08zX0Nos1mKvZbmPWjzM5VtbTE&usqp=CAU'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Salar',
                              style: TextStyle(
                                  color: Colors.white24,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Rating:- 4/5',
                              style: TextStyle(
                                  color: Colors.white24,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                for (int i = 0; i <= 10; i++)
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 150,
                            width: 200,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://www.filmibeat.com/img/165x246/popcorn/movie_posters/fast--furious-7-20130920154311-13150.jpg'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Fast & \nfurious 7',
                                style: TextStyle(
                                    color: Colors.white24,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Rating:- 4/5',
                                style: TextStyle(
                                    color: Colors.white24,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                for (int i = 0; i <= 10; i++)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 150,
                          width: 250,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://stat4.bollywoodhungama.in/wp-content/uploads/2017/11/Jumanji-Welcome-to-The-Jungle-English-01-306x393.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Jumanji',
                              style: TextStyle(
                                  color: Colors.white24,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Rating:- 4/5',
                              style: TextStyle(
                                  color: Colors.white24,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
      Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                for (int i = 0; i <= 10; i++)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 150,
                          width: 200,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://www.themanual.com/wp-content/uploads/sites/9/2021/12/4ldpbxicygkkr8fghgjklphrfuc.jpg?p=1#038;p=1.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              'Dumb &\n Dumber',
                              style: TextStyle(
                                  color: Colors.white24,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Rating:- 4/5',
                              style: TextStyle(
                                  color: Colors.white24,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    ][_tabController.index];
  }
}
