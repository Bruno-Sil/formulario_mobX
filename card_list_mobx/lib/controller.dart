import 'package:card_list_mobx/models/cliente.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';


class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var cliente = Cliente();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }

  String validateName() {

  if (cliente.name == null || cliente.name.isEmpty) {
      return "Este campo é obrigatório!";
    } else if (cliente.name.length < 3) {
      return "Seu nome precisa ter mais de 3 caracteres!";
    }
    return null;
  }

  String validateEmail() {

  if (cliente.email == null || cliente.email.isEmpty) {
      return "Este campo é obrigatório!";
    } else if (!cliente.email.contains("@")) {
      return "Esse não é um email válido!";
    }
    return null;
  }

  dispose() {
    
  }
  
}
