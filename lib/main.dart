import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialScreen(),
    ),
  );
}

// AQUI INICIAL A PRIMEIRA PAGINA DA APLICAÇAO
// COM BOTOES E DIRECIONAMENTOS LOGICOS

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Inicial"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centraliza verticalmente
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centraliza horizontalmente
            children: <Widget>[
              AnimatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                text: "Frases do dia",
              ),

              // BOTAO GASOLINA
              const SizedBox(height: 20),
              AnimatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TelaCombustivel()),
                  );
                },
                text: "Gasolina",
              ),

              // BOTAO JOGO
              const SizedBox(height: 20),
              AnimatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JogoScreen()),
                  );
                },
                text: "Seção de Jogos",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget AnimatedButton para animação e tamanho fixo
class AnimatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const AnimatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // Duração da animação
      curve: Curves.easeInOut, // Tipo de animação
      width: 300, // Largura fixa para todos os botões
      height: 50, // Altura fixa para todos os botões
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF000041), // Cor do texto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// AQUI INICIA O APLICATIVO DE FRASES

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Lista de frases que podem ser geradas
  final List<String> frases = [
    "O código é difícil, mas a persistência transforma dificuldades em soluções.",
    "A cada bug, uma nova oportunidade de aprendizado.",
    "Não tenha medo de errar, cada falha é um passo para o sucesso.",
    "A prática constante é a chave para se tornar um mestre do código.",
    "A jornada de um programador começa com um simples Hello World.",
    "Seja curioso, pois o conhecimento em programação nunca tem fim."
  ];

  // Variável que armazena a frase atual
  String fraseAtual = "Clique abaixo para gerar uma frase!";

  // Função que gera uma frase aleatória
  void gerarFrase() {
    setState(() {
      // Gerar um índice aleatório da lista de frases
      final random = Random();
      fraseAtual = frases[random.nextInt(frases.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frases do dia"),
        centerTitle: true,
        backgroundColor: const Color(0xFF000041),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  fraseAtual,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 22),
                TextButton(
                  onPressed: gerarFrase,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(206, 45, 52, 95),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Nova Frase",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                    height: 20), // Espaçamento antes do botão "Voltar"
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InitialScreen()),
                    );
                  },
                  child: const Text("Voltar ao Início"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// AQUI INICIA O JOGO JOKEPON

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _mensagem = "Escolha uma opção abaixo";
  var _imagemApp = "assets/padrao.png";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var escolhaApp = opcoes[Random().nextInt(3)];

    switch (escolhaApp) {
      case "pedra":
        _imagemApp = "assets/pedra.png";
        break;
      case "papel":
        _imagemApp = "assets/papel.png";
        break;
      case "tesoura":
        _imagemApp = "assets/tesoura.png";
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      _mensagem = "Você ganhou!";
    } else if (escolhaUsuario == escolhaApp) {
      _mensagem = "Empate!";
    } else {
      _mensagem = "Você perdeu!";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pedra, Papel e Tesoura",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromARGB(206, 45, 52, 95),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Aqui é onde você define a cor branca
                ),
              ),
            ),
            Image.asset(_imagemApp, height: 100),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _mensagem,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // E aqui também
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset('assets/pedra.png', height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset('assets/papel.png', height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset('assets/tesoura.png', height: 100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// APLICATIVO DA GASOLINA

class TelaCombustivel extends StatefulWidget {
  const TelaCombustivel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TelaCombustivelState createState() => _TelaCombustivelState();
}

class _TelaCombustivelState extends State<TelaCombustivel> {
  final TextEditingController _valorController = TextEditingController();
  String _resultado = '';
  String _mensagemErro = '';

  double precoAlcool = 5.39;
  double precoGasolina = 6.59;

  String _combustivelEscolhido = 'Álcool';

  // Função para validar o valor inserido
  bool _validarValor(double valor) {
    if (valor <= 0) {
      setState(() {
        _mensagemErro = 'O valor deve ser maior que zero.';
        _resultado = '';
      });
      return false;
    }
    return true;
  }

  void calcular() {
    double valor = double.tryParse(_valorController.text) ?? 0;

    // Se o valor for inválido ou zero, mostra mensagem de erro
    if (!_validarValor(valor)) return;

    setState(() {
      _mensagemErro = ''; // Limpar a mensagem de erro, se houver

      // Calculando a quantidade de litros dependendo do combustível escolhido
      if (_combustivelEscolhido == 'Álcool') {
        _resultado =
            'Quantidade de: ${(valor / precoAlcool).toStringAsFixed(2)} litros de Álcool';
      } else {
        _resultado =
            'Quantidade de: ${(valor / precoGasolina).toStringAsFixed(2)} litros de Gasolina';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha de Combustível'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background.jpg'), // Coloque o caminho da sua imagem aqui
            fit: BoxFit.cover, // Ajusta a imagem para cobrir o fundo todo
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Dropdown para selecionar o combustível
              DropdownButton<String>(
                value: _combustivelEscolhido,
                onChanged: (String? newValue) {
                  setState(() {
                    _combustivelEscolhido = newValue!;
                  });
                },
                items: <String>['Álcool', 'Gasolina']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

              // Campo para digitar o valor
              TextField(
                controller: _valorController,
                decoration: InputDecoration(
                  labelText: 'Digite o valor do abastecimento',
                  errorText: _mensagemErro.isNotEmpty ? _mensagemErro : null,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true), // Suporte para valores decimais
              ),

              // Botão de calcular
              ElevatedButton(
                onPressed: calcular,
                child: const Text('Calcular'),
              ),

              // Exibição do resultado
              const SizedBox(height: 20),
              Text(
                _resultado,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// JOGO CARA OU COROA

class JogoCaraOuCoroa extends StatefulWidget {
  const JogoCaraOuCoroa({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JogoCaraOuCoroaState createState() => _JogoCaraOuCoroaState();
}

class _JogoCaraOuCoroaState extends State<JogoCaraOuCoroa> {
  final List<String> opcoes = ['Cara', 'Coroa'];
  String resultado = '';

  void jogar() {
    setState(() {
      resultado = opcoes[
          (opcoes.length * DateTime.now().millisecondsSinceEpoch).toInt() %
              opcoes.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cara ou Coroa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Resultado: $resultado', style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: jogar,
              child: const Text('Jogar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}

class JogoScreen extends StatelessWidget {
  const JogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seção de Jogos"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const JogoCaraOuCoroa()),
                  );
                },
                text: "Cara ou Coroa",
              ),
              const SizedBox(height: 20),
              AnimatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Jogo()),
                  );
                },
                text: "Pedra, papel e tesoura",
              ),
              const SizedBox(height: 20),
              AnimatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TerceiroJogo()),
                  );
                },
                text: "Tiro ao alvo",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//JOGO DE TIRO AO ALVO

class TerceiroJogo extends StatefulWidget {
  const TerceiroJogo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TerceiroJogoState createState() => _TerceiroJogoState();
}

class _TerceiroJogoState extends State<TerceiroJogo> {
  // Posições do alvo
  double targetX = 0.5;
  double targetY = 0.5;

  // Contador de pontos
  int score = 0;

  // Tamanho do alvo
  double targetSize = 100;

  // Função para gerar novas coordenadas aleatórias para o alvo
  void _generateNewTarget() {
    setState(() {
      targetX = Random().nextDouble();
      targetY = Random().nextDouble();
    });
  }

  // Função para detectar o clique e verificar se acertou o alvo
  void _onTap(double x, double y) {
    double dx = (x - targetX) * MediaQuery.of(context).size.width;
    double dy = (y - targetY) * MediaQuery.of(context).size.height;

    double distance = sqrt(dx * dx + dy * dy);

    // Se a distância entre o clique e o alvo for menor que o tamanho do alvo, acertou
    if (distance < targetSize) {
      setState(() {
        score++;
        _generateNewTarget();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terceiro Jogo - Tiro ao Alvo"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTapDown: (TapDownDetails details) {
          // Obtém as coordenadas relativas à tela para o clique
          final RenderBox renderBox = context.findRenderObject() as RenderBox;
          final localPosition = renderBox.globalToLocal(details.globalPosition);
          _onTap(localPosition.dx / renderBox.size.width,
              localPosition.dy / renderBox.size.height);
        },
        child: Stack(
          children: [
            // Tela de fundo
            Container(
              color: Colors.lightBlueAccent,
              child: Center(
                child: Text(
                  'Pontos: $score',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // O alvo
            Positioned(
              left:
                  targetX * MediaQuery.of(context).size.width - targetSize / 2,
              top:
                  targetY * MediaQuery.of(context).size.height - targetSize / 2,
              child: GestureDetector(
                onTap: _generateNewTarget,
                child: Container(
                  width: targetSize,
                  height: targetSize,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8.0,
                        spreadRadius: 3.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
