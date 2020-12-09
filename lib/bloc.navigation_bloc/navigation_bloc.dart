// import 'package:bloc/bloc.dart';
// import 'package:dashboard_flutter_01/main.dart';
// import 'package:dashboard_flutter_01/Welcome/IntroScreen.dart';
//
// enum NavigationEvents {
//   IntroScreenClickedEvent,
// }
//
// abstract class NavigationStates {}
//
// class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
//   @override
//   NavigationStates get initialState => IntroScreen();
//
//   @override
//   Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
//     switch (event) {
//       case NavigationEvents.IntroScreenClickedEvent:
//         yield IntroScreen();
//         break;
//       // case NavigationEvents.MyAccountClickedEvent:
//       //   yield MyAccountsPage();
//       //   break;
//       // case NavigationEvents.MyOrdersClickedEvent:
//       //   yield MyOrdersPage();
//       //   break;
//     }
//   }
// }
