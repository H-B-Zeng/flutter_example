import 'package:flutter/material.dart';
// import '../authentication_bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/movie/movie.dart';
import 'home/show_movie_widget.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePage();
}

class _MoviePage extends State<MoviePage> {
  MovieBloc _movieBloc;
  final MovieRepository _movieRepository = MovieRepository();
  int _selectIndex = 0;

  @override
  void initState() {
    _movieBloc = MovieBloc(movieRepository: _movieRepository);
    _movieBloc.dispatch(FetchPopular('TW'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    void _onTap(int index) {
      setState(() {
        _selectIndex = index;
      });

      switch (index) {
        case 0:
          _movieBloc.dispatch(FetchPopular('TW'));
          break;
        case 1:
          _movieBloc.dispatch(FetchNowPlaying('TW') as FetchPopular);
          break;
        case 2:
          _movieBloc.dispatch(FetchTopRated('TW') as FetchPopular);
          break;
      }
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        // drawer: SideDrawer(
        //   email: widget.email,
        // ),
        // bottomNavigationBar: NavigationBar(
        //   destinations: [
        //     NavigationDestination(
        //       icon: Icon(Icons.star),
        //       label: 'Popular',
        //     ),
        //     NavigationDestination(
        //         icon: Icon(Icons.play_circle_filled), label: 'Now Playing'),
        //     NavigationDestination(
        //         icon: Icon(Icons.thumb_up), label: 'Top Rated'),
        //   ],
        //   onDestinationSelected: (int index) {
        //     setState(() {
        //       currentIndex = index;
        //       _onTap(index);
        //     });
        //   },
        //   selectedIndex: currentIndex,
        // ),
        backgroundColor: Colors.transparent,
        body: BlocBuilder(
          bloc: _movieBloc,
          builder: (context, state) {
            if (state is LoadingMovie) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is InitMovieState) {
              return Center(
                child: Text('Init Movie'),
              );
            } else if (state is PopularMovieState) {
              return ShowMovieWidget(
                movieList: state.movieList,
                category: 'Popular',
              );
            } else if (state is NowPlayingMovieState) {
              return ShowMovieWidget(
                movieList: state.movieList,
                category: 'Now Playing',
              );
            } else if (state is TopRatedMovieState) {
              return ShowMovieWidget(
                movieList: state.movieList,
                category: 'Top Rated',
              );
            }
            return Center(
              child: Text('Failed'),
            );
          },
        ),
      ),
    );
  }
}

Widget buildList(state) {
  return GridView.builder(
      itemCount: state.movieList.results.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
            child: InkResponse(
          enableFeedback: true,
          child: Image.network(
            'https://image.tmdb.org/t/p/w185${state.movieList.results[index].posterPath}',
            fit: BoxFit.cover,
          ),
        ));
      });
}
