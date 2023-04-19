import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project2/models/getMoviesModel.dart';
import 'package:project2/service/mongoDbCall.dart';
import 'package:project2/widgets/bottom_bar.dart';
import 'package:project2/widgets/filter_row.dart';
import 'package:project2/widgets/heading_text.dart';
import 'package:project2/widgets/movieList.dart';
import 'package:project2/models/DiscoverMovieModel.dart';
import 'package:project2/service/apiCall.dart';
import 'package:project2/widgets/futureMovieList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Movie models
  List<DiscoverMovieModel> _discoverMovie = [];
  var fetchmoviedb;
  var fetchpopularmovie;
  var fetchscifimovie;
  var fetchkidsmovie;
  var topRatedmovie;
  var horrorComedymovie;
  // var itemrecommendation;
  // var userrecommendation;

  @override
  void initState() {
    fetchMovies();
    fetchmoviedb = MongoDatabase.getMovies();
    fetchpopularmovie = MongoDatabase.getPopularMovies();
    fetchscifimovie = MongoDatabase.getScifiMovies();
    fetchkidsmovie = MongoDatabase.getKidsMovies();
    topRatedmovie = MongoDatabase.getTopRated();
    horrorComedymovie = MongoDatabase.getHorrorComedy();
    super.initState();
  }

  Future<void> fetchMovies() async {
    final response1 = await discoverMovies();
    setState(() {
      _discoverMovie = response1;
    });
  }

  //Local Variables
  int screen_index = 0;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Image.asset(
                  'assets/images/moviegologo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search_screen');
                },
                icon: Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: _discoverMovie
                  .map((item) => InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 280,
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/original${item.posterPath}",
                                    fit: BoxFit.cover,
                                    height: 245,
                                    width: 180,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        "assets/images/noimage.png",
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                item.originalTitle,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 350,
                viewportFraction: 0.6,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  futureMovieList(
                      heading: "Discover Movies", movies: fetchmoviedb),
                  // futureMovieList(
                  //     heading: "You May also Like", movies: itemrecommendation),
                  // futureMovieList(
                  //     heading: "For You", movies: userrecommendation),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: const [Colors.black12, Colors.blueAccent],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 170,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Find More What You Like",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                    Text(
                                      "Find movies based on your current mood",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 80,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/images/cardimg1.png',
                                    fit: BoxFit.cover,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 290,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/recommender_screen');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text("Try it Now"),
                          ),
                        )
                      ],
                    ),
                  ),
                  futureMovieList(
                      heading: "Popular Movies", movies: fetchpopularmovie),
                  futureMovieList(
                      heading: "Top SciFi Movies", movies: fetchscifimovie),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Top Genres",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilterRow(count: 10, elements: const [
                    "Action",
                    "Adventure",
                    "Thriller",
                    "Horror",
                    "SciFi",
                    "Documentary",
                    "Drama",
                    "Comedy",
                    "Crime",
                    "Romance"
                  ]),
                  futureMovieList(
                      heading: "Popular Kids Moves", movies: fetchkidsmovie),
                  futureMovieList(
                      heading: "Top Rated Movies", movies: topRatedmovie),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: const [Colors.blue, Colors.white],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 170,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Check out your favourite lists",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                    Text(
                                      "Get a look at your saved movies",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 80,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/images/cardimg2.png',
                                    fit: BoxFit.cover,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 290,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/watch_list');
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text("Try it Now"),
                          ),
                        )
                      ],
                    ),
                  ),
                  futureMovieList(
                      heading: "Mix of Horror and Comedy",
                      movies: horrorComedymovie),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        screen_index: 0,
      ),
    );
  }
}
