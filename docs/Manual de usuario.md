# Manual de Usuario - docuAI
## Plataforma de Documentación Inteligente con IA


## 📚 Índice

1. [Introducción](#introducción)
2. [Primeros Pasos](#primeros-pasos)
3. [Instalación del Sistema](#instalación-del-sistema)
4. [Acceso a la Plataforma](#acceso-a-la-plataforma)
5. [Guía de Uso por Componente](#guía-de-uso-por-componente)
6. [Casos de Uso Prácticos](#casos-de-uso-prácticos)
7. [Resolución de Problemas](#resolución-de-problemas)
8. [Preguntas Frecuentes](#preguntas-frecuentes)
9. [Soporte Técnico](#soporte-técnico)

---

## 📖 Introducción

### ¿Qué es docuAI?

**docuAI** es una plataforma integral que combina inteligencia artificial, automatización y colaboración para revolucionar la gestión de documentación técnica. Permite:

- **Consultar documentos con lenguaje natural**: Haz preguntas sobre tu documentación como si hablaras con un experto
- **Automatizar tareas repetitivas**: Procesa inventarios, analiza diseños KiCad y convierte audio a texto
- **Colaborar en tiempo real**: Trabaja en equipo con un editor tipo Notion
- **Mantener privacidad**: Toda la IA funciona localmente, sin enviar datos externos

### ¿Para quién está dirigido?

- **Ingenieros y técnicos** que manejan documentación compleja
- **Equipos de desarrollo** que necesitan colaboración eficiente
- **Gestores de proyectos** que requieren acceso rápido a información técnica
- **Organizaciones** que valoran la privacidad de sus datos

---

## 🚀 Primeros Pasos

### Requisitos Previos

Antes de comenzar, asegúrate de tener:

#### Hardware Mínimo
- **Procesador**: 8 núcleos (12+ recomendado)
- **Memoria RAM**: 16GB (32GB recomendado)
- **Almacenamiento**: 100GB libres (200GB+ recomendado)
- **Tarjeta gráfica**: Opcional pero recomendada (NVIDIA con 8GB+ VRAM)

#### Software Necesario
- **Sistema operativo**: Linux, Windows 10/11, o macOS
- **Docker Desktop**: Versión 24.0 o superior
- **Git**: Para descargar el código
- **Navegador web**: Chrome, Firefox, Safari o Edge

### Verificación del Sistema

Antes de instalar, verifica que tienes los requisitos:

```bash
# Verificar Docker
docker --version

# Verificar Docker Compose
docker compose version

# Verificar Git
git --version

# Verificar espacio en disco (Linux/macOS)
df -h

# Verificar memoria RAM (Linux)
free -h
```

---

## 🛠️ Instalación del Sistema

### Paso 1: Descargar docuAI

1. **Abrir terminal** en tu sistema
2. **Navegar** a la carpeta donde quieres instalar docuAI
3. **Clonar el repositorio**:

```bash
git clone --recursive https://github.com/DevAlteria/docuAI.git
cd docuAI
```

### Paso 2: Configuración Inicial

El sistema se configura automáticamente, pero puedes personalizar algunos aspectos:

```bash
# Ver configuración por defecto (opcional)
cat envs/dev/deploy.env

# Editar configuración si necesitas cambiar algo (opcional)
nano envs/dev/deploy.env
```

### Paso 3: Construir y Lanzar

```bash
# Construir e iniciar todos los servicios
make up
```

**⏱️ Tiempo estimado**: 10-20 minutos (dependiendo de tu conexión a internet)

### Paso 4: Descargar Modelos de IA

```bash
# Descargar modelos de inteligencia artificial
make ollamaPull
```

**⏱️ Tiempo estimado**: 15-30 minutos (los modelos son grandes)

### Paso 5: Verificar Instalación

```bash
# Verificar que todos los servicios están funcionando
make ps
```

Deberías ver todos los servicios en estado "Up" o "running".

---

## 🌐 Acceso a la Plataforma

Una vez instalado, puedes acceder a los diferentes componentes:

### URLs de Acceso

| Servicio | URL | Descripción |
|----------|-----|-------------|
| **Página Principal** | http://localhost | Portal de entrada |
| **Chat IA** | http://localhost/webui | Interfaz conversacional |
| **Automatización** | http://localhost/n8n | Flujos de trabajo |
| **Documentación** | http://appflowy.localhost | Editor colaborativo |
| **Almacenamiento** | http://localhost/minio | Gestión de archivos |

> 📝 **Nota**: Las URLs pueden variar según tu configuración. Si no funcionan, revisa el archivo `envs/dev/deploy.env`.

### Primera Configuración

1. **Acceder a N8N** (http://localhost/n8n):
   - Crear cuenta de administrador
   - Configurar email y contraseña

2. **Acceder a AppFlowy** (http://appflowy.localhost):
   - Registrarse con email
   - Crear tu primer workspace

3. **Acceder a Chat IA** (http://localhost/webui):
   - Crear cuenta o usar como invitado
   - Seleccionar modelo DeepSeek-R1

---

## 📋 Guía de Uso por Componente

### 🤖 Open WebUI - Chat con IA

#### Funciones Principales
- **Conversación natural** con documentos técnicos
- **Análisis de archivos** PDF, Excel, imágenes
- **Generación de código** y documentación
- **Resúmenes automáticos** de documentos largos

#### Cómo Usar

1. **Iniciar conversación**:
   ```
   Hola, ¿puedes ayudarme a analizar este documento técnico?
   ```

2. **Subir archivos**:
   - Clic en el icono 📎
   - Seleccionar archivo (PDF, imagen, Excel)
   - Hacer preguntas sobre el contenido

3. **Consultas específicas**:
   ```
   ¿Qué componentes aparecen en este esquema?
   Resume los puntos principales de este manual
   Genera una lista de materiales de este diseño
   ```

#### Consejos de Uso
- **Sé específico** en tus preguntas
- **Contextualiza** la información que necesitas
- **Usa comandos claros**: "resume", "lista", "analiza", "compara"

### ⚡ N8N - Automatización

#### Flujos Preconfigurados

##### CHAT - Interfaz Principal
- **Propósito**: Maneja conversaciones con usuarios
- **Usar cuando**: Necesites interacción automática con usuarios

##### HOCK - PREGUNTAS
- **Propósito**: Procesa y responde preguntas complejas
- **Usar cuando**: Quieras automatizar respuestas a consultas frecuentes

##### CHILD - RETRIVE INVENTORY
- **Propósito**: Consulta información de inventarios
- **Usar cuando**: Necesites buscar componentes o materiales
- **Ejemplo de consulta**: "¿Tenemos resistencias de 10kΩ?"

##### CHILD - RETRIVE KICAD
- **Propósito**: Analiza archivos de diseño KiCad
- **Usar cuando**: Quieras extraer información de circuitos
- **Formatos soportados**: .sch, .kicad_pcb, .pro

#### Cómo Crear Flujos Personalizados

1. **Acceder a N8N** (http://localhost/n8n)
2. **Crear nuevo workflow**:
   - Clic en "New workflow"
   - Arrastrar nodos desde la barra lateral
   - Conectar nodos con líneas

3. **Nodos más útiles**:
   - **HTTP Request**: Para llamar APIs
   - **Code**: Para lógica personalizada
   - **Gmail**: Para enviar emails
   - **PostgreSQL**: Para consultar bases de datos

4. **Guardar y activar**:
   - Clic en "Save"
   - Toggle "Active" para activar

5. **Exportar tu flujo**:
   ```bash
   make n8n-export-workflows
   ```

### 📝 AppFlowy - Documentación Colaborativa

#### Características Principales
- **Editor tipo Notion** con bloques flexibles
- **Colaboración en tiempo real** con tu equipo
- **Bases de datos integradas** para organizar información
- **Templates personalizables** para diferentes tipos de documentos

#### Primeros Pasos

1. **Crear tu primer documento**:
   - Clic en "+" en la barra lateral
   - Seleccionar "Document"
   - Escribir título y contenido

2. **Añadir diferentes tipos de bloques**:
   - **Texto**: Para párrafos normales
   - **Títulos**: H1, H2, H3 para estructura
   - **Listas**: Bullets o numeradas
   - **Código**: Para snippets técnicos
   - **Tablas**: Para datos estructurados

3. **Crear base de datos**:
   - Clic en "+" → "Database"
   - Definir columnas (texto, número, fecha, etc.)
   - Añadir filas con información

#### Casos de Uso en AppFlowy

##### Documentación de Proyectos
```markdown
# Proyecto X - Especificaciones

## Resumen
Descripción del proyecto...

## Componentes Necesarios
| Componente | Cantidad | Estado |
|------------|----------|--------|
| Resistencia 10kΩ | 50 | ✅ |
| Capacitor 100µF | 20 | ⏳ |
```

##### Gestión de Inventarios
- Crear base de datos con columnas: Componente, Cantidad, Ubicación, Estado
- Usar filtros para encontrar componentes específicos
- Colaborar con el equipo en tiempo real

##### Documentación de Procesos
- Crear templates para procedimientos estándar
- Usar checkboxes para listas de verificación
- Vincular con documentos relacionados

### 🗄️ MinIO - Almacenamiento de Archivos

#### Acceso y Configuración

1. **Acceder a MinIO** (http://localhost/minio)
2. **Credenciales por defecto**:
   - Usuario: `minioadmin`
   - Contraseña: `minioadmin`

#### Gestión de Archivos

1. **Crear buckets**:
   - Clic en "Create Bucket"
   - Nombre descriptivo (ej: "documentos-tecnicos")

2. **Subir archivos**:
   - Seleccionar bucket
   - Drag & drop archivos
   - Organizar en carpetas

3. **Compartir archivos**:
   - Clic en archivo → "Share"
   - Copiar enlace para compartir

---

## 💡 Casos de Uso Prácticos

### Caso 1: Análisis de Documentación Técnica

**Escenario**: Tienes un manual de 200 páginas y necesitas encontrar información específica.

**Solución con docuAI**:

1. **Subir documento** a Open WebUI
2. **Hacer preguntas específicas**:
   ```
   ¿Cuáles son los requisitos de instalación?
   Lista todos los códigos de error mencionados
   ¿Qué mantenimiento preventivo recomienda?
   ```
3. **Obtener respuestas inmediatas** con referencias a páginas específicas

### Caso 2: Gestión de Inventarios Inteligente

**Escenario**: Necesitas consultar disponibilidad de componentes para un nuevo proyecto.

**Solución con docuAI**:

1. **Configurar base de datos** de inventario en AppFlowy
2. **Usar flujo N8N** "CHILD - RETRIVE INVENTORY"
3. **Consultar por chat**:
   ```
   ¿Tenemos suficientes resistencias de 1kΩ para hacer 100 PCBs?
   ¿Qué alternativas hay si no tenemos el componente X?
   ```

### Caso 3: Análisis de Diseños KiCad

**Escenario**: Quieres extraer automáticamente la lista de materiales de un diseño PCB.

**Solución con docuAI**:

1. **Subir archivos KiCad** a MinIO
2. **Activar flujo** "CHILD - RETRIVE KICAD"
3. **Obtener automáticamente**:
   - Lista de componentes (BOM)
   - Conexiones críticas
   - Posibles problemas de diseño

### Caso 4: Documentación Colaborativa de Proyectos

**Escenario**: Un equipo de 5 ingenieros necesita documentar un proyecto complejo.

**Solución con docuAI**:

1. **Crear workspace** en AppFlowy para el proyecto
2. **Estructurar documentación**:
   - Especificaciones técnicas
   - Progreso de tareas
   - Base de datos de componentes
   - Notas de reuniones
3. **Colaborar en tiempo real** con comentarios y ediciones
4. **Integrar con IA** para generar resúmenes automáticos

### Caso 5: Conversión de Audio a Documentación

**Escenario**: Tienes grabaciones de reuniones técnicas que quieres convertir en documentos.

**Solución con docuAI**:

1. **Subir archivo de audio** (.oga, .wav) a N8N
2. **Usar script SpeechToText.py** automáticamente
3. **Obtener transcripción** en español
4. **Procesar con IA** para extraer puntos clave:
   ```
   Resume los puntos principales de esta reunión
   ¿Qué decisiones técnicas se tomaron?
   Lista las tareas asignadas a cada persona
   ```

---

## 🔧 Resolución de Problemas

### Problemas Comunes y Soluciones

#### ❌ Error: "Docker no está ejecutándose"

**Síntomas**: Mensajes de error al ejecutar `make up`

**Solución**:
```bash
# En Windows/macOS: Abrir Docker Desktop
# En Linux:
sudo systemctl start docker
sudo systemctl enable docker
```

#### ❌ Error: "Puerto ocupado"

**Síntomas**: Error "port already in use" o "puerto ya está en uso"

**Solución**:
```bash
# Ver qué procesos usan los puertos
sudo netstat -tulpn | grep :8080
sudo netstat -tulpn | grep :5678

# Terminar proceso específico
sudo kill -9 [PID]

# O cambiar puertos en envs/dev/docker-compose.yml
```

#### ❌ Error: "Modelos de IA no cargan"

**Síntomas**: Open WebUI no muestra modelos disponibles

**Solución**:
```bash
# Verificar estado de Ollama
docker logs ollama

# Descargar modelos manualmente
make ollamaPull

# Verificar modelos descargados
docker exec ollama ollama list
```

#### ❌ Error: "N8N no guarda flujos"

**Síntomas**: Los workflows desaparecen al reiniciar

**Solución**:
```bash
# Verificar permisos de carpetas
sudo chown -R $USER:$USER envs/dev/data/

# Reiniciar N8N
docker compose -f envs/dev/docker-compose.yml restart n8n
```

#### ❌ Error: "AppFlowy no conecta"

**Síntomas**: Error de conexión en AppFlowy

**Solución**:
```bash
# Verificar PostgreSQL
docker logs postgres

# Verificar conectividad
docker exec postgres pg_isready

# Reiniciar servicios relacionados
docker compose -f envs/dev/docker-compose.yml restart postgres appflowy-cloud
```

### Comandos de Diagnóstico

```bash
# Ver estado de todos los servicios
make ps

# Ver logs de todos los servicios
make logs

# Ver logs de un servicio específico
docker logs [nombre_servicio]

# Ver uso de recursos
docker stats

# Verificar conectividad de red
docker network ls
docker network inspect docuai_default
```

---

## ❓ Preguntas Frecuentes

### Instalación y Configuración

**P: ¿Cuánto espacio necesito en disco?**
R: Mínimo 100GB, recomendado 200GB. Los modelos de IA ocupan mucho espacio.

**P: ¿Puedo usar docuAI sin GPU?**
R: Sí, pero será más lento. Los modelos funcionan solo con CPU, aunque tardará más en responder.

**P: ¿Necesito conexión a internet constantemente?**
R: Solo para la instalación inicial y descarga de modelos. Después funciona completamente offline.

### Uso General

**P: ¿Qué tipos de archivos puedo analizar?**
R: PDF, Excel, Word, imágenes (PNG, JPG), archivos KiCad (.sch, .kicad_pcb), audio (.oga, .wav).

**P: ¿Cuántos usuarios pueden usar el sistema simultáneamente?**
R: Depende del hardware, pero típicamente 5-10 usuarios concurrentes con el hardware recomendado.

**P: ¿Los datos están seguros?**
R: Sí, todo funciona localmente. Ningún dato sale de tu servidor.

### Problemas Técnicos

**P: ¿Por qué la IA responde lento?**
R: Puede ser por falta de GPU, poca RAM, o modelos muy grandes para tu hardware. Considera usar modelos más pequeños.

**P: ¿Puedo cambiar el idioma de la IA?**
R: Sí, los modelos entienden múltiples idiomas. Para speech-to-text, edita el script SpeechToText.py.

**P: ¿Cómo hago backup de mis datos?**
R: Usa los comandos `make appflowy-export` y `make n8n-export-workflows`.

### Personalización

**P: ¿Puedo añadir más modelos de IA?**
R: Sí, edita el archivo `models.txt` y ejecuta `make ollamaPull`.

**P: ¿Puedo cambiar las URLs de acceso?**
R: Sí, modifica el archivo `envs/dev/deploy.env` y reinicia con `make up`.

**P: ¿Puedo crear mis propios flujos de automatización?**
R: Absolutamente. Usa la interfaz web de N8N para crear flujos personalizados.

---

## 📞 Soporte Técnico

### Antes de Contactar Soporte

1. **Revisar este manual** y la sección de problemas comunes
2. **Verificar logs** con `make logs`
3. **Comprobar requisitos** de hardware y software
4. **Intentar reiniciar** servicios específicos

### Información a Incluir en Solicitudes de Soporte

- **Sistema operativo** y versión
- **Versión de Docker** (`docker --version`)
- **Mensaje de error completo**
- **Logs relevantes** (usar `make logs`)
- **Pasos** para reproducir el problema

### Canales de Soporte

- **Email técnico**: dev@alteriaautomation.com
- **Issues en GitHub**: [https://github.com/DevAlteria/docuAI/issues]
- **Documentación técnica**: Carpeta `docs/` del repositorio

### Tiempos de Respuesta

- **Consultas generales**: 24-48 horas
- **Problemas críticos**: 4-8 horas (horario laboral)
- **Mejoras y nuevas funcionalidades**: 1-2 semanas

---

## 🎓 Recursos Adicionales

### Documentación Técnica
- `docs/arquitecturaCasosUso.md`: Arquitectura detallada del sistema
- `README.md`: Información técnica para desarrolladores
- `Makefile`: Comandos disponibles comentados

### Tutoriales en Video
- [Próximamente] Instalación paso a paso
- [Próximamente] Creación de flujos N8N
- [Próximamente] Uso avanzado de AppFlowy

### Comunidad
- Únete a nuestra comunidad de usuarios
- Comparte casos de uso y soluciones
- Contribuye al desarrollo del proyecto

---

## 📝 Historial de Versiones

### Versión Actual (2025.1)
- ✅ Integración con DeepSeek-R1 14B
- ✅ Flujos N8N especializados
- ✅ AppFlowy v0.9.64
- ✅ Soporte completo para español
- ✅ Scripts de Speech-to-Text

### Próximas Funcionalidades
- 🔜 Soporte para más idiomas
- 🔜 Integración con Slack/Teams
- 🔜 API REST para integraciones
- 🔜 Dashboard de métricas

---

<div align="center">

**Manual de Usuario docuAI v1.0**

*Desarrollado por [Alteria Automation SL](https://alteriaautomation.com)*

*Financiado por la Unión Europea - Programa PERTE*

---

*Última actualización: Julio 2025*

</div>
