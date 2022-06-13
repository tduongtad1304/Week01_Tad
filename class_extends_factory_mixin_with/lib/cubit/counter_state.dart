part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int value;

  const CounterState({required this.value});

  factory CounterState.init() => const CounterState(value: 0);

  @override
  List<Object?> get props => [value];

  CounterState copyWith({
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }
}
