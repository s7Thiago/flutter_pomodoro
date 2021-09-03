import 'package:mobx/mobx.dart';

/// Classe gerada pelo Mobx a partir do comando 'flutter pub run build_runner watch'
part 'pomodoro.store.g.dart';

/// Criando uma instância acessível da classe privada _PomodoroStore a partir do código gerado pelo MobX
class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  // Para que seja possível modificar algo observável, é necessário utilizar o decorator @action

  // incrementa o tempo de trabalho
  @action
  void incrementaTempoTrabalho() {
    tempoTrabalho++;
  }

  // decrementa o tempo de trabalho
  @action
  void decrementaTempoTrabalho() {
    tempoTrabalho--;
  }

  // incrementa o tempo de descanso
  @action
  void incrementaTempoDescanso() {
    tempoDescanso++;
  }

  // decrementa o tempo de descanso
  @action
  void decrementaTempoDescanso() {
    tempoDescanso--;
  }
}
