import 'dart:async';

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
  TipoIntervalo tipoIntervalo = TipoIntervalo.trabalho;

  Timer? cronometro;

  // Para que seja possível modificar algo observável, é necessário utilizar o decorator @action

  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      // Quando zerar os minutos e segundos, o tipo de intervalo é mudado
      if (minutos == 0 && segundos == 0) {
        _alternarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
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

  // alterna os tipos de intervalo
  @action
  void _alternarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.descanso;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.trabalho;
      minutos = tempoTrabalho;
    }

    segundos = 0;
  }
}
