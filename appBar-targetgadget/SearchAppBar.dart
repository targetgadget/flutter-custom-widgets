import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldState;
  final Widget child;
  final ButtonPosition buttonPosition;
  final double elevation;
  final Color iconColor;

  const SearchAppBar(
      {Key key,
      this.context,
      this.scaffoldState,
      this.child,
      this.buttonPosition,
      this.elevation,
      this.iconColor})
      : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(MediaQuery.of(context)
              .orientation ==
          Orientation.landscape
      ? 48.0
      : 56.0); //for landscape 48.0 is the height and for portrait 56.0 is height and both are for mobile view

}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
            elevation: widget.elevation ?? 2.0,
            margin: EdgeInsets.all(4.0),
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(children: <Widget>[
                  widget.buttonPosition == ButtonPosition.left ||
                          widget.buttonPosition == null
                      ? _button()
                      : SizedBox(),
                  Expanded(
                      child: widget.child ??
                          Text("Error! No child has been passed!",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.red))),
                  widget.buttonPosition == ButtonPosition.right
                      ? _button()
                      : SizedBox()
                ]))));
  }

  Widget _button() {
    return IconButton(
        icon: Icon(
          Icons.menu,
          color: widget.iconColor ?? widget.child == null
              ? Colors.red
              : Colors.black87,
        ),
        onPressed: widget.scaffoldState == null
            ? null
            : () => widget.scaffoldState.currentState.openDrawer());
  }
}

enum ButtonPosition { left, right }
