# Documentação do Aplicativo Flutter

## 🚀 Visão Geral
Este aplicativo Flutter foi desenvolvido com o objetivo de demonstrar funcionalidades variadas por meio de uma interface intuitiva e organizada. O aplicativo oferece as seguintes seções principais:

* Frases do Dia: Gera frases motivacionais aleatórias.
* Gasolina: (descrição futura do módulo).
* Seção de Jogos: Inclui um jogo de Pedra, Papel e Tesoura.

  
## 2. Tecnologias Utilizadas:

* Linguagem: Dart
* Framework: Flutter
* Outras Dependências:
  * dart:math: Para geração de números aleatórios.
  * flutter/material.dart: Para construção da interface de usuário.
  
##3. Estrutura do Projeto

#Páginas Principais
 1 .InitialScreen:
    *Tela inicial com botões de navegação para as funcionalidades do app.
    *Inclui um fundo customizado e animações (GIF).
    
Home:
   * Tela que exibe frases motivacionais aleatórias.
   * Botão para gerar novas frases e retornar à tela inicial.
     
TelaCombustivel:
   * (Descrição do módulo ainda não implementada).
   * 
JogoScreen:
   * Tela para iniciar o jogo Pedra, Papel e Tesoura (em construção).

     
##4. Configuração e Execução

Pré-requisitos
  * Flutter SDK instalado.
  * Dispositivo emulador ou físico configurado para execução.
    
##Passos para Executar

Clone o repositório:

bash
Copiar código
git clone https://github.com/usuario/meu_aplicativo.git
cd meu_aplicativo
Instale as dependências:

bash
Copiar código
flutter pub get
Execute o aplicativo:

bash
Copiar código
flutter run
5. Estrutura do Código
Tela Inicial (InitialScreen)
Apresenta um fundo com uma imagem personalizada.
Três botões principais:
Frases do Dia: Navega para a página "Home".
Gasolina: (Função futura).
Seção de Jogos: Navega para a página "JogoScreen".
Frases do Dia (Home)
Exibe frases motivacionais escolhidas aleatoriamente de uma lista.
Possui:
Botão para gerar nova frase.
Botão para voltar à tela inicial.
Componente Personalizado (AnimatedButton)
Botão com animação suave e estilo consistente.
6. Recursos e Design
Fundo:
Imagens localizadas na pasta assets.
Configuradas no arquivo pubspec.yaml.
Estilos:
Uso de estilos personalizados em botões e textos para uma interface atrativa.
Animações:
GIFs adicionados para enriquecer a experiência visual.
7. Funcionalidades Futuras
Implementação da funcionalidade do botão "Gasolina".
Finalização do jogo "Pedra, Papel e Tesoura".
8. Licença
Este projeto está licenciado sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.


