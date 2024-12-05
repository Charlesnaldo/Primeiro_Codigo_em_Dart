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
            image: AssetImage('assets/background3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //  GIF antes dos botões
              Image.asset(
                'assets/animation.gif',
                height: 400,
                width: 400,
              ),

              const SizedBox(height: 5), // Espaço entre o GIF e os botões

              // Botão Frases do Dia
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Botões arredondados
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.green, // Cor do botão
                ),
                child: const Text(
                  "Frases do Dia",
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 20),

              // Botão Gasolina
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TelaCombustivel()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Botões arredondados
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blue, // Cor do botão
                ),
                child: const Text(
                  "Gasolina",
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 20),

              // Botão Seção de Jogos
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JogoScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Botões arredondados
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor:
                      const Color.fromARGB(208, 244, 148, 141), // Cor do botão
                ),
                child: const Text(
                  "Seção de Jogos",
                  style: TextStyle(fontSize: 18),
                ),
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
          color: Color.fromARGB(255, 244, 245, 246),
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
                    color: Color.fromARGB(255, 46, 105, 192),
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

// AQUI INICIA O JOGO PEDRA, PAPEL E TESOURA

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
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Expande os widgets para a largura total
            children: [
              // Dropdown para selecionar o combustível
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: DropdownButton<String>(
                  value: _combustivelEscolhido,
                  onChanged: (String? newValue) {
                    setState(() {
                      _combustivelEscolhido = newValue!;
                    });
                  },
                  isExpanded: true,
                  items: <String>['Álcool', 'Gasolina']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              // Campo para digitar o valor
              TextField(
                controller: _valorController,
                decoration: InputDecoration(
                  labelText: 'Digite o valor do abastecimento',
                  errorText: _mensagemErro.isNotEmpty ? _mensagemErro : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.7),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true), // Suporte para valores decimais
              ),

              const SizedBox(height: 20),

              // Botão de calcular
              ElevatedButton(
                onPressed: calcular,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), // Cor do texto
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Calcular'),
              ),

              const SizedBox(height: 20),

              // Exibição do resultado
              if (_resultado.isNotEmpty)
                Text(
                  _resultado,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
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
  String resultado = '';
  String imagemResultado =
      'assets/placeholder.png'; // Substitua por uma imagem padrão ou inicial
  final List<String> opcoes = ['Cara', 'Coroa'];

  void jogar() {
    final random = Random();
    int index = random.nextInt(opcoes.length);

    setState(() {
      resultado = opcoes[index];
      imagemResultado =
          resultado == 'Cara' ? 'assets/cara.png' : 'assets/coroa.png';
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
            // Exibe a imagem do resultado com animação
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: resultado.isEmpty
                  ? const Text(
                      'Clique em "Jogar" para começar!',
                      key: ValueKey<String>('instrução'),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  : Column(
                      key: ValueKey<String>(resultado),
                      children: [
                        Image.asset(
                          imagemResultado,
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Resultado: $resultado',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 40),
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

// PAGINA DE JOGOS COM TODOS OS JOGOS,

class JogoScreen extends StatelessWidget {
  const JogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seção de Jogos"),
        centerTitle: true,
        backgroundColor: Colors.transparent, // Transparência do fundo
        elevation: 0, // Remove a sombra do AppBar
        flexibleSpace: Container(
          color:
              Colors.transparent, // Garantir a transparência do espaço flexível
        ),
      ),
      body: Stack(
        fit: StackFit
            .expand, // Faz a imagem de fundo ocupar toda a área disponível
        children: <Widget>[
          // Imagem de fundo que ocupa toda a tela
          const Positioned.fill(
            child: Image(
              image: AssetImage(
                  'assets/jogo1.png'), // Certifique-se que a imagem está na pasta assets
              fit: BoxFit.cover, // A imagem de fundo deve cobrir toda a tela
            ),
          ),
          // Conteúdo da tela, agora posicionado sobre a imagem de fundo
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Botão para "Cara ou Coroa"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JogoCaraOuCoroa()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      backgroundColor:
                          const Color(0xff8dc63f), // Cor de fundo do botão
                    ),
                    child: const Text(
                      "Cara ou Coroa",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Botão para "Pedra, Papel e Tesoura"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Jogo()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      backgroundColor: const Color.fromARGB(255, 185, 206, 245),
                    ),
                    child: const Text(
                      "Pedra, papel e tesoura",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Botão para "Tiro ao alvo"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TerceiroJogo()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      backgroundColor: const Color(0xffefc6ff),
                    ),
                    child: const Text(
                      "Capturando Olaf",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//JOGO CAPTURANDO OLAF

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
        title: const Text("Capture o OlaF"),
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
            // Tela de fundo com imagem
            Positioned.fill(
              child: Image.asset(
                'assets/background3.jpg', // Imagem de fundo
                fit: BoxFit.cover,
              ),
            ),
            // Texto de pontuação
            Positioned(
              top: 50,
              left: 20,
              child: Text(
                'Olaf Capturados : $score',
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            // O alvo (aqui usamos uma imagem para o alvo)
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
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/animation.gif'), // Substitua com sua imagem de alvo
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8.0,
                        spreadRadius: 3.0,
                      ),
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
