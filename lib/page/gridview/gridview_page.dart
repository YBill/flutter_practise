import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: const Text('GridView')),
        body: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30), width: 350 * 4 + 25 * 3, child: _renderContent()),
          ),
        ));
  }

  Widget _renderContent() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 350 / 125,
          crossAxisSpacing: 25,
          mainAxisSpacing: 20,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return _renderContentItem();
        });
  }

  Widget _renderContentItem() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          offset: const Offset(0, 4),
          blurRadius: 4,
        ),
      ]),
      child: Row(children: [
        Container(margin: const EdgeInsets.only(left: 22, right: 20), width: 87, height: 87, color: const Color(0XFFE1EBF1)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_renderItemText('Player 1: ', 'Username123'), _renderItemText('Player 2: ', 'Username456'), _renderItemTimes()],
        )
      ]),
    );
  }

  Widget _renderItemText(String player, String userName) {
    var style = const TextStyle(color: Color(0xFF222222), fontSize: 14);
    return Text.rich(
        TextSpan(children: [TextSpan(text: player, style: style.copyWith(fontWeight: FontWeight.w600)), TextSpan(text: userName, style: style)]));
  }

  Widget _renderItemTimes() {
    return Container(
      width: 100,
      height: 30,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: const Color(0XFF60BAA6), borderRadius: BorderRadius.circular(45)),
      child: const Text('128 Times', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }
}
