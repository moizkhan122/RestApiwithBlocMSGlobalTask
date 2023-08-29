import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabbar_cubit_state.dart';

class TabbarCubitCubit extends Cubit<TabbarCubitState> {
  TabbarCubitCubit() : super(TabbarCubitInitial());
}
