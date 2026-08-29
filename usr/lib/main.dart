import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AvicolaApp());
}

class AvicolaApp extends StatelessWidget {
  const AvicolaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Avícola Santa Rosa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32), // Verde sustentable
          secondary: const Color(0xFFF9A825), // Amarillo/Dorado (huevos, sol)
        ),
        textTheme: GoogleFonts.latoTextTheme(),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PresentationScreen(),
      },
    );
  }
}

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Avícola Santa Rosa de Conlara',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        actions: isDesktop
            ? [
                TextButton(
                  onPressed: () => _scrollToSection(0),
                  child: const Text('Inicio'),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(700),
                  child: const Text('El Proyecto'),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(1400),
                  child: const Text('Fases'),
                ),
                TextButton(
                  onPressed: () => _scrollToSection(2100),
                  child: const Text('Economía Circular'),
                ),
                const SizedBox(width: 16),
                FilledButton.icon(
                  onPressed: () => _scrollToSection(2800),
                  icon: const Icon(Icons.solar_power, size: 18),
                  label: const Text('Solicitud'),
                ),
                const SizedBox(width: 24),
              ]
            : null,
      ),
      drawer: isDesktop
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      'Menú',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Inicio'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(0);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.business),
                    title: const Text('El Proyecto'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(700);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.timeline),
                    title: const Text('Fases de Crecimiento'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(1400);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.autorenew),
                    title: const Text('Economía Circular'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(2100);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.solar_power),
                    title: const Text('Solicitud y Sustentabilidad'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(2800);
                    },
                  ),
                ],
              ),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const HeroSection(),
            const ProjectOverviewSection(),
            const PhasesSection(),
            const CircularEconomySection(),
            const SustainabilityRequestSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

// --- Sections ---

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 500),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? size.width * 0.1 : 24,
        vertical: 60,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
        image: const DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1590509618585-7033501bcab5?q=80&w=2070&auto=format&fit=crop'), // Granja representativa
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Proyecto de Desarrollo Provincial',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Complejo Avícola\nSanta Rosa de Conlara',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: isDesktop ? 56 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Producción sustentable, economía circular y generación de empleo genuino.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 24 : 18,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectOverviewSection extends StatelessWidget {
  const ProjectOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? size.width * 0.1 : 24,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            'El Proyecto Final',
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Un complejo integral diseñado para la máxima eficiencia y clasificación.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 800
                  ? 4
                  : constraints.maxWidth > 500
                      ? 2
                      : 1;
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 0.9,
                children: const [
                  _FeatureCard(
                    icon: Icons.pets,
                    title: '120.000 Ponedoras',
                    description:
                        'Distribuídas en 4 galpones de 30.000 aves cada uno.',
                  ),
                  _FeatureCard(
                    icon: Icons.calendar_month,
                    title: 'Ciclos Escalonados',
                    description:
                        'Diferencia de 6 meses de edad entre galpones para obtener 4 tamaños de huevos.',
                  ),
                  _FeatureCard(
                    icon: Icons.local_shipping,
                    title: 'Logística Propia',
                    description:
                        'Planta de clasificación en el predio y camión para distribución directa.',
                  ),
                  _FeatureCard(
                    icon: Icons.work,
                    title: 'Empleo Local',
                    description:
                        'Iniciando con 2 puestos fijos y creciendo conforme a las fases del proyecto.',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class PhasesSection extends StatelessWidget {
  const PhasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? size.width * 0.1 : 24,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            'Fases de Crecimiento',
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildPhase(context, true)),
                    const SizedBox(width: 48),
                    Expanded(child: _buildPhase(context, false)),
                  ],
                )
              : Column(
                  children: [
                    _buildPhase(context, true),
                    const SizedBox(height: 48),
                    _buildPhase(context, false),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildPhase(BuildContext context, bool isInitial) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isInitial
            ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)
            : Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.3),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isInitial
              ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
              : Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isInitial
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              isInitial ? 'Fase Inicial' : 'Proyecto Culminado',
              style: TextStyle(
                color: isInitial
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          _PhaseItem(
            icon: Icons.home_work,
            text: isInitial
                ? '1 Galpón de 30.000 gallinas.'
                : '4 Galpones de 30.000 gallinas (120k total).',
          ),
          const SizedBox(height: 16),
          _PhaseItem(
            icon: Icons.egg,
            text: isInitial
                ? 'Planta de alimentos balanceados operativa.'
                : 'Galpón de recría (30k aves) para auto-abastecimiento y renovación del plantel.',
          ),
          const SizedBox(height: 16),
          _PhaseItem(
            icon: Icons.eco,
            text: isInitial
                ? 'Tratamiento de compostaje inicial.'
                : 'Clasificación de 4 tamaños de huevo constantes.',
          ),
        ],
      ),
    );
  }
}

class CircularEconomySection extends StatelessWidget {
  const CircularEconomySection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? size.width * 0.1 : 24,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            'Economía Circular y Sustentabilidad',
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            'Aprovechamiento total de los recursos para minimizar el impacto ambiental.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _CircularCard(
                icon: Icons.grass,
                title: 'Planta de Alimentos',
                description:
                    'Fabricación propia del alimento balanceado para garantizar la nutrición óptima de las aves.',
              ),
              _CircularCard(
                icon: Icons.recycling,
                title: 'Tratamiento de Mortandad',
                description:
                    'Centro de punto de compostaje específico para gallinas muertas, asegurando bioseguridad.',
              ),
              _CircularCard(
                icon: Icons.compost,
                title: 'Fábrica de Fertilizantes',
                description:
                    'Compostaje del guano mediante tractor y máquina volteadora, creando subproductos de alto valor.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SustainabilityRequestSection extends StatelessWidget {
  const SustainabilityRequestSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? size.width * 0.1 : 24,
        vertical: 80,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: const DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1509391366360-12ce027eeb20?q=80&w=2070&auto=format&fit=crop'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black54,
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.solar_power, size: 64, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(height: 24),
          Text(
            'Impulso Tecnológico: Energía Solar',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'El objetivo de esta presentación a la Provincia es solicitar apoyo financiero/crediticio para la implementación de paneles solares. Esto permitirá alimentar los galpones con energía renovable, haciendo del complejo en Santa Rosa de Conlara un modelo de sustentabilidad e innovación avícola en la región.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isDesktop ? 20 : 16,
                color: Colors.white.withOpacity(0.9),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      color: Colors.black87,
      child: Column(
        children: [
          Text(
            'Avícola Santa Rosa de Conlara',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Presentación Provincial - Proyecto de Inversión',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Componentes auxiliares ---

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _PhaseItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _PhaseItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.black54),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class _CircularCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _CircularCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
