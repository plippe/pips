import 'package:flutter/material.dart';
import 'package:pip/tiles/tile.dart';
import 'package:pip/tiles/widgets/tile_grid_widget.dart';
import 'package:pip/games/game_state.dart';
import 'package:pip/triples/is_triple.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final GameState _state = GameState.empty();

  void _onTileTap(Tile tile) => setState(() {
        IsTriple isTriple = _state.onTileTap(tile);

        if (isTriple == IsTriple.incomplete) {
        } else if (isTriple == IsTriple.yes) {
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("This isn't a valid set")));
        }
      });

  void _refreshTiles() => setState(() {
        _state.refreshTiles();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TileGridWidget(
            tiles: _state.displayed.underlying,
            selectedTiles: _state.selected.underlying,
            onTileTap: _onTileTap,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshTiles,
        backgroundColor: Colors.black,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
