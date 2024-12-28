// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MatchCardController extends GetxController {
// final ScrollController leftScrollController = ScrollController();
// final ScrollController rightScrollController = ScrollController();

//   var leftHighlightedIndex = 0.obs;
//   var rightHighlightedIndex = 0.obs;

//   var leftSelectedItem = ''.obs;
//   var rightSelectedItem = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     leftScrollController.addListener(() {
//       _onScroll(isLeft: true, offset: leftScrollController.offset);
//     });

//     rightScrollController.addListener(() {
//       _onScroll(isLeft: false, offset: rightScrollController.offset);
//     });
//   }

//   void _onScroll({required bool isLeft, required double offset}) {
//     final newIndex = (offset ~/ 248);
//     if (isLeft) {
//       leftHighlightedIndex.value = newIndex;
//       leftSelectedItem.value = 'Left Item $newIndex';
//     } else {
//       rightHighlightedIndex.value = newIndex;
//       rightSelectedItem.value = 'Right Item $newIndex';
//     }
//   }

//   @override
//   void onClose() {
//     leftScrollController.dispose();
//     rightScrollController.dispose();
//     super.onClose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchCardController extends GetxController {
  final ScrollController leftScrollController = ScrollController();
  final ScrollController rightScrollController = ScrollController();

  var leftHighlightedIndex = 0.obs;
  var rightHighlightedIndex = 0.obs;

  var leftSelectedItem = ''.obs;
  var rightSelectedItem = ''.obs;

  @override
  void onInit() {
    super.onInit();

    // Attach scroll listeners
    leftScrollController.addListener(() {
      updateHighlightedIndexFromScroll(isLeft: true);
    });

    rightScrollController.addListener(() {
      updateHighlightedIndexFromScroll(isLeft: false);
    });
  }

  void updateHighlightedIndex(int index, {required bool isLeft}) {
    if (isLeft) {
      leftHighlightedIndex.value = index;
      leftSelectedItem.value = 'Left Item $index';
    } else {
      rightHighlightedIndex.value = index;
      rightSelectedItem.value = 'Right Item $index';
    }
  }

  void updateHighlightedIndexFromScroll({required bool isLeft}) {
    final ScrollController controller =
        isLeft ? leftScrollController : rightScrollController;
    final index = (controller.offset / 250).round(); // 250 is the card height
    if (isLeft) {
      if (index != leftHighlightedIndex.value) {
        leftHighlightedIndex.value = index;
      }
    } else {
      if (index != rightHighlightedIndex.value) {
        rightHighlightedIndex.value = index;
      }
    }
  }

  @override
  void onClose() {
    leftScrollController.dispose();
    rightScrollController.dispose();
    super.onClose();
  }
}
