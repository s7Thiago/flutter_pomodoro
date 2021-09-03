import 'package:mobx/mobx.dart';

/// Classe gerada pelo Mobx a partir do comando 'flutter pub run build_runner watch'
part 'pomodoro.store.g.dart';

enum TipoIntervalo { trabalho, descanso }

/// Criando uma instância acessível da classe privada _PomodoroStore a partir do código gerado pelo MobX
class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.descanso;

  // Para que seja possível modificar algo observável, é necessário utilizar o decorator @action

  @action
  void iniciar() {
    iniciado = true;
  }

  @action
  void parar() {
    iniciado = false;
  }

  @action
  void reiniciar() {
    iniciado = false;
    minutos = 0;
    segundos = 0;
  }

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

  // retorna verdadeiro se o tipo de intervalo atual for trabalho
  bool estaTrabalhando() {
    return tipoIntervalo == TipoIntervalo.trabalho;
  }

  // retorna verdadeiro se o tipo de intervalo atual for descanso
  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.descanso;
  }
}
