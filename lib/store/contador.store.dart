import 'package:mobx/mobx.dart';

/// Classe gerada pelo Mobx a partir do comando 'flutter pub run build_runner watch'
part 'contador.store.g.dart';

/// Criando uma instância acessível da classe ContadorStore a partir do código gerado pelo MobX
class ContadorStore = _ContadorStore with _$ContadorStore;

/// Como a reatividade não irá ocorrer a partir desta classe, ela é privada
abstract class _ContadorStore with Store {
  @observable

  /// Indica que a variável em questão será observável
  int contador = 0;

  @action

  /// Indica que a função em questão será uma ação
  void incrementar() {
    contador++;
  }
}
