import 'package:rxdart/rxdart.dart';

class CounterBloc {
  // 값과 로직을 옮김.
  int _count = 0;

  // 값을 계속 받고 마지막 값만 뱉어냄!! rxDart 에 있는 것임
  final _counterSubject = BehaviorSubject.seeded(0);

  void addCounter() {
    _count++;
    _counterSubject.add(_count);
  }

  // 외부에 count 값을 줄 때 BehaviorSubject stream 으로 관찰해서 준다.
  // 외부에서 stream을 요청할 때 BehaviorSubject stream 준다.
  Stream<int> get count$ => _counterSubject.stream;
}