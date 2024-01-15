part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}
class CounterIncrement extends CounterState {

}
class CounterDecrement extends CounterState {}

