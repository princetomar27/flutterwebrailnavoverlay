import 'dart:async';
import 'package:flutter/material.dart';
import 'rail_nav_bar_menu_item.dart';

class RailNavBarWidget extends StatefulWidget {
  final int selectedIndex;
  final List<RailNavbarMenuItem> railNavbarMenuItemsList;
  final ValueChanged<int> onItemSelected;

  const RailNavBarWidget({
    required this.selectedIndex,
    required this.railNavbarMenuItemsList,
    required this.onItemSelected,
  });

  @override
  RailNavBarWidgetState createState() => RailNavBarWidgetState();
}

const kNavigationActionWidth = 80.0;

class RailNavBarWidgetState extends State<RailNavBarWidget> {
  OverlayEntry? _overlayEntry;
  final List<GlobalKey> _hoverKeys = [];
  bool _isInOverlay = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.railNavbarMenuItemsList.length; i++) {
      _hoverKeys.add(GlobalKey());
    }
  }

  void _showOverlay(
      BuildContext context, List<HoverItemConfig> hoverItems, int index) {
    final renderBox =
        _hoverKeys[index].currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }
    final globalOffset = renderBox.localToGlobal(Offset.zero);

    const itemHeight = 50.0;
    const verticalPadding = 6.0;
    final containerHeight =
        (hoverItems.length * itemHeight) + (2 * verticalPadding);

    double railActionPositionFromTop;
    final currentScreenHeight = MediaQuery.of(context).size.height;
    final currentRailActionItemSpaceLeftFromBottom =
        currentScreenHeight - globalOffset.dy;

    if (currentRailActionItemSpaceLeftFromBottom < containerHeight) {
      railActionPositionFromTop = globalOffset.dy -
          (containerHeight) +
          kBottomNavigationBarHeight / 1.5;
    } else {
      railActionPositionFromTop = globalOffset.dy;
    }

    if (_overlayEntry != null) {
      _overlayEntry!.remove();
    }
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: globalOffset.dx + kNavigationActionWidth - 15,
        top: railActionPositionFromTop,
        child: MouseRegion(
          onEnter: (_) {
            _isInOverlay = true;
            _timer?.cancel();
          },
          onExit: (_) {
            _isInOverlay = false;
            _removeOverlay();
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: containerHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black45,
                ),
              ),
              width: 200,
              child: Column(
                children: hoverItems.map((hoverItem) {
                  bool isHovered = false;

                  return StatefulBuilder(
                    builder: (context, setState) {
                      return MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            isHovered = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isHovered = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                isHovered ? Colors.white : Colors.cyan.shade900,
                            border: Border.all(
                              color: Colors.cyan.shade900,
                            ),
                          ),
                          margin:
                              EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                          child: ListTile(
                            title: Text(
                              hoverItem.itemName,
                              style: TextStyle(
                                color: isHovered
                                    ? Colors.cyan.shade900
                                    : Colors.white,
                                fontWeight: isHovered
                                    ? FontWeight.bold
                                    : FontWeight.w400,
                              ),
                            ),
                            onTap: () {
                              hoverItem.onTap();
                              _removeOverlay();
                            },
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_isInOverlay) return;
    _timer = Timer(const Duration(milliseconds: 200), () {
      if (!_isInOverlay) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: widget.onItemSelected,
      labelType: NavigationRailLabelType.all,
      destinations: widget.railNavbarMenuItemsList.asMap().entries.map(
        (entry) {
          int index = entry.key;
          RailNavbarMenuItem item = entry.value;
          return NavigationRailDestination(
            icon: SizedBox(
              height: kBottomNavigationBarHeight,
              child: MouseRegion(
                key: _hoverKeys[index],
                onEnter: (event) {
                  setState(() {});
                  if (item.hoverItems != null && item.hoverItems!.isNotEmpty) {
                    final renderBox = _hoverKeys[index]
                        .currentContext
                        ?.findRenderObject() as RenderBox?;
                    if (renderBox != null) {
                      _showOverlay(context, item.hoverItems!, index);
                    }
                  }
                },
                onExit: (event) {
                  _removeOverlay();
                },
                child: GestureDetector(
                  onTap: () => widget.onItemSelected(item.index),
                  child: Icon(item.iconPath),
                ),
              ),
            ),
            label: Text(item.name),
          );
        },
      ).toList(),
    );
  }
}
