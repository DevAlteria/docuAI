# Guía de Instalación - iaDoc
## Plataforma de Documentación Inteligente con IA

<p align="center">
  <img src="../assets/logoNextGen.png" width="25%"/>
  <img src="../assets/logoGobiernoEspana.jpg" width="35%"/>
  <img src="../assets/logoPerte.png" width="17%"/>
  <img src="../assets/logoComunidadMadrid.png" width="8%"/>
</p>

---

## 📚 Índice

1. [Introducción](#introducción)
2. [Requisitos Previos](#requisitos-previos)
3. [Preparación del Sistema](#preparación-del-sistema)
4. [Instalación Paso a Paso](#instalación-paso-a-paso)
5. [Verificación de la Instalación](#verificación-de-la-instalación)
6. [Configuración Inicial](#configuración-inicial)
7. [Solución de Problemas](#solución-de-problemas)
8. [Desinstalación](#desinstalación)

---

## 📖 Introducción

Esta guía te llevará paso a paso a través del proceso de instalación de **iaDoc**, una plataforma integral de documentación inteligente que combina IA, automatización y colaboración.

### ¿Qué se instalará?

- **🤖 Servicios de IA**: Ollama con modelos DeepSeek-R1, Open WebUI
- **⚡ Automatización**: N8N con flujos preconfigurados
- **📝 Colaboración**: AppFlowy para documentación colaborativa
- **🗄️ Almacenamiento**: PostgreSQL con pgvector, MinIO, Redis
- **🌐 Infraestructura**: Nginx, GoTrue para autenticación

### Tiempo Estimado de Instalación

- **Preparación**: 15-30 minutos
- **Descarga e instalación**: 30-60 minutos
- **Configuración inicial**: 15-30 minutos
- **Total**: 1-2 horas (dependiendo de tu conexión a internet)

---

## 💻 Requisitos Previos

### Requisitos de Hardware

#### Configuración Mínima
| Componente | Especificación | Notas |
|------------|----------------|-------|
| **CPU** | 8 núcleos | AMD Ryzen 5 / Intel Core i5 o superior |
| **RAM** | 16GB | 32GB recomendado para mejor rendimiento |
| **Alamcenamiento** | 100GB SSD | 200GB+ recomendado para múltiples modelos |
| **GPU** | Opcional | NVIDIA con 8GB+ VRAM para mejor rendimiento |
| **Red** | Conexión estable | Para descarga inicial de modelos (20-30GB) |

#### Configuración Recomendada
| Componente | Especificación | Beneficios |
|------------|----------------|------------|
| **CPU** | 12+ núcleos | Mejor paralelización de servicios |
| **RAM** | 32GB+ | Ejecutar modelos grandes sin swap |
| **Almacenamiento** | 200GB+ NVMe SSD | Acceso rápido a modelos y datos |
| **GPU** | NVIDIA RTX 4070+ | Aceleración significativa de IA |

### Requisitos de Software

#### Sistemas Operativos Soportados
- **Linux**: Ubuntu 20.04+, Debian 11+, CentOS 8+, Fedora 35+
- **macOS**: 10.15+ (Catalina o superior)
- **Windows**: Windows 10/11 con WSL2

#### Software Base Requerido
- **Docker Desktop**: Versión 24.0 o superior
- **Docker Compose**: Versión 2.0 o superior (incluido en Docker Desktop)
- **Git**: Cualquier versión reciente
- **Make**: Para ejecutar comandos automatizados

---

## 🔧 Preparación del Sistema

### Paso 1: Verificar Recursos del Sistema

#### En Linux:
```bash
# Verificar CPU
lscpu | grep -E '^CPU\(s\)|Model name'

# Verificar RAM
free -h

# Verificar espacio en disco
df -h

# Verificar GPU (si aplicable)
lspci | grep -i nvidia
nvidia-smi  # Si tienes drivers NVIDIA instalados
```

#### En macOS:
```bash
# Verificar CPU
system_profiler SPHardwareDataType | grep "Processor"

# Verificar RAM
system_profiler SPHardwareDataType | grep "Memory"

# Verificar espacio en disco
df -h
```

#### En Windows (PowerShell):
```powershell
# Verificar CPU
Get-WmiObject -Class Win32_Processor | Select-Object Name

# Verificar RAM
Get-WmiObject -Class Win32_ComputerSystem | Select-Object TotalPhysicalMemory

# Verificar espacio en disco
Get-WmiObject -Class Win32_LogicalDisk | Select-Object Size,FreeSpace,DeviceID
```

### Paso 2: Instalar Docker Desktop

#### En Linux (Ubuntu/Debian):
```bash
# Actualizar el sistema
sudo apt update && sudo apt upgrade -y

# Instalar dependencias
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Añadir clave GPG de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Añadir repositorio de Docker
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Instalar Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Añadir usuario al grupo docker
sudo usermod -aG docker $USER

# Reiniciar sesión o ejecutar:
newgrp docker
```

#### En macOS:
1. **Descargar Docker Desktop** desde [docker.com](https://www.docker.com/products/docker-desktop)
2. **Instalar** arrastrando a la carpeta Applications
3. **Ejecutar** Docker Desktop y seguir la configuración inicial
4. **Verificar** que Docker está ejecutándose (icono en la barra de menú)

#### En Windows:
1. **Habilitar WSL2**:
   ```powershell
   # Ejecutar como Administrador
   wsl --install
   # Reiniciar el sistema
   ```
2. **Descargar Docker Desktop** desde [docker.com](https://www.docker.com/products/docker-desktop)
3. **Instalar** siguiendo el asistente
4. **Configurar** para usar WSL2 backend
5. **Verificar** instalación

### Paso 3: Instalar Git

#### En Linux:
```bash
# Ubuntu/Debian
sudo apt install -y git

# CentOS/RHEL/Fedora
sudo yum install -y git
# o en versiones más nuevas:
sudo dnf install -y git
```

#### En macOS:
```bash
# Con Homebrew
brew install git

# O descargar desde git-scm.com
```

#### En Windows:
1. **Descargar** Git desde [git-scm.com](https://git-scm.com/download/win)
2. **Instalar** con configuración por defecto
3. **Verificar** en PowerShell o CMD

### Paso 4: Instalar Make

#### En Linux:
```bash
# Ubuntu/Debian
sudo apt install -y make

# CentOS/RHEL/Fedora
sudo yum install -y make
```

#### En macOS:
```bash
# Con Homebrew
brew install make

# O instalar Xcode Command Line Tools
xcode-select --install
```

#### En Windows:
```bash
# En WSL2 (Ubuntu)
sudo apt install -y make

# O usar chocolatey en PowerShell (como administrador)
choco install make
```

### Paso 5: Verificar Instalaciones

```bash
# Verificar Docker
docker --version
docker compose version

# Verificar Git
git --version

# Verificar Make
make --version

# Probar Docker (debe mostrar "Hello World")
docker run hello-world
```

---

## 🚀 Instalación Paso a Paso

### Paso 1: Obtener el Código Fuente

```bash
# Crear directorio de trabajo (opcional)
mkdir -p ~/proyectos
cd ~/proyectos

# Clonar el repositorio con todos los submódulos
git clone --recursive https://github.com/DevAlteria/iaDoc.git

# Entrar al directorio
cd iaDoc

# Verificar que los submódulos se descargaron
ls -la src/appflowy/
```

> ⚠️ **Importante**: Si olvidas usar `--recursive`, puedes inicializar los submódulos después:
> ```bash
> git submodule update --init --recursive
> ```

### Paso 2: Configuración de Variables de Entorno

```bash
# Ver la configuración por defecto
cat envs/dev/deploy.env

# (Opcional) Crear una copia para personalizar
cp envs/dev/deploy.env envs/dev/deploy.env.backup

# (Opcional) Editar configuración personalizada
nano envs/dev/deploy.env
```

#### Variables Importantes que Puedes Modificar:

```bash
# Dominio principal (cambiar si usas un dominio real)
FQDN=localhost

# Protocolo (cambiar a https en producción)
WEB_PROTOCOL=http

# Puertos (cambiar si hay conflictos)
OLLAMA_PORT=7869
WEBUI_PORT=8080
N8N_PORT=5678

# Credenciales de base de datos (cambiar en producción)
POSTGRES_PASSWORD=tu_password_seguro
```

### Paso 3: Construir e Iniciar los Servicios

```bash
# Opción 1: Instalación completa automática (recomendado)
make re

# Opción 2: Instalación paso a paso
# make build    # Construir imágenes
# make up       # Iniciar servicios
# make ollamaPull  # Descargar modelos de IA
```

> ⏱️ **Tiempo estimado**: 30-60 minutos
> - Construcción de imágenes: 10-15 minutos
> - Descarga de modelos de IA: 20-45 minutos (dependiendo de conexión)

### Paso 4: Monitorear el Progreso

En otra terminal, puedes monitorear el progreso:

```bash
cd iaDoc

# Ver estado de contenedores
make ps

# Ver logs en tiempo real
make logs

# Ver logs de un servicio específico
docker compose -f envs/dev/docker-compose.yml logs -f ollama
```

### Paso 5: Verificar Descarga de Modelos

```bash
# Ver modelos descargados
docker exec ollama ollama list

# Debería mostrar algo como:
# NAME                    ID              SIZE    MODIFIED
# deepseek-r1:14b         abc123def       8.1 GB  2 minutes ago
# nomic-embed-text:v1.5   def456ghi       274 MB  3 minutes ago
# all-minillm-l6-v2:latest hij789klm      23 MB   4 minutes ago
```

---

## ✅ Verificación de la Instalación

### Paso 1: Verificar Estado de Servicios

```bash
# Verificar que todos los servicios están ejecutándose
make ps

# Todos los servicios deben mostrar estado "Up" o "running"
```

### Paso 2: Verificar Conectividad de Red

```bash
# Verificar puertos abiertos
netstat -tulpn | grep -E ':(5678|7869|8080|80|443)'

# O en macOS:
lsof -i :5678 -i :7869 -i :8080 -i :80
```

### Paso 3: Pruebas de Acceso Web

Abre tu navegador y verifica estos URLs:

| Servicio | URL | Estado Esperado |
|----------|-----|-----------------|
| **Página Principal** | http://localhost | ✅ Página de bienvenida |
| **Open WebUI** | http://localhost/webui | ✅ Interfaz de chat |
| **N8N** | http://localhost/n8n | ✅ Panel de automatización |
| **AppFlowy** | http://appflowy.localhost | ✅ Editor colaborativo |
| **MinIO** | http://localhost/minio | ✅ Panel de almacenamiento |

> 📝 **Nota**: Si usas un dominio personalizado, reemplaza `localhost` por tu dominio.

### Paso 4: Prueba Funcional Básica

#### Probar Open WebUI:
1. Ir a http://localhost/webui
2. Crear cuenta o usar como invitado
3. Seleccionar modelo "deepseek-r1:14b"
4. Escribir: "Hola, ¿cómo estás?"
5. ✅ Debería responder en español

#### Probar N8N:
1. Ir a http://localhost/n8n
2. Crear cuenta de administrador
3. Verificar que hay workflows preinstalados
4. ✅ Debería mostrar flujos como "CHAT", "HOCK - PREGUNTAS", etc.

#### Probar AppFlowy:
1. Ir a http://appflowy.localhost
2. Registrarse con email
3. Crear un documento de prueba
4. ✅ Debería permitir edición en tiempo real

---

## ⚙️ Configuración Inicial

### Configurar N8N

1. **Acceder a N8N**: http://localhost/n8n
2. **Crear cuenta de administrador**:
   - Email: tu_email@empresa.com
   - Contraseña: (usar contraseña segura)
   - Nombre: Tu Nombre
3. **Activar workflows importantes**:
   - CHAT
   - HOCK - PREGUNTAS
   - CHILD - RETRIVE INVENTORY
4. **Configurar credenciales**:
   - PostgreSQL (ya configurada automáticamente)
   - Ollama (ya configurada automáticamente)

### Configurar AppFlowy

1. **Acceder a AppFlowy**: http://appflowy.localhost
2. **Crear cuenta**:
   - Email: tu_email@empresa.com
   - Contraseña: (usar contraseña segura)
3. **Crear primer workspace**:
   - Nombre: "Mi Empresa"
   - Descripción: "Documentación técnica"
4. **Crear documento de prueba**:
   - Título: "Manual de Prueba"
   - Contenido: Escribir algo para probar

### Configurar Open WebUI

1. **Acceder a Open WebUI**: http://localhost/webui
2. **Crear cuenta**:
   - Email: tu_email@empresa.com
   - Contraseña: (usar contraseña segura)
3. **Configurar modelo por defecto**:
   - Seleccionar "deepseek-r1:14b"
   - Configurar como modelo por defecto
4. **Probar funcionalidad**:
   - Subir un documento PDF
   - Hacer preguntas sobre el contenido

### Configurar MinIO

1. **Acceder a MinIO**: http://localhost/minio
2. **Credenciales por defecto**:
   - Usuario: `minioadmin`
   - Contraseña: `minioadmin`
3. **Crear buckets para organización**:
   - `documentos-tecnicos`
   - `inventarios`
   - `disenos-kicad`
4. **Configurar políticas de acceso** según necesidades

---

## 🔧 Solución de Problemas

### Problema 1: Docker no está ejecutándose

**Síntomas**:
```
Cannot connect to the Docker daemon at unix:///var/run/docker.sock
```

**Solución**:
```bash
# Linux
sudo systemctl start docker
sudo systemctl enable docker

# macOS/Windows: Abrir Docker Desktop
```

### Problema 2: Puertos ocupados

**Síntomas**:
```
Error: Port 8080 is already in use
```

**Solución**:
```bash
# Ver qué proceso usa el puerto
sudo netstat -tulpn | grep :8080
# o en macOS:
lsof -i :8080

# Terminar proceso conflictivo
sudo kill -9 [PID]

# O cambiar puerto en envs/dev/docker-compose.yml
```

### Problema 3: Submódulos no inicializados

**Síntomas**:
```
src/appflowy/ directory is empty
```

**Solución**:
```bash
git submodule update --init --recursive
```

### Problema 4: Falta de espacio en disco

**Síntomas**:
```
No space left on device
```

**Solución**:
```bash
# Limpiar imágenes Docker no utilizadas
docker system prune -a

# Limpiar volúmenes no utilizados
docker volume prune

# Ver uso de espacio por Docker
docker system df
```

### Problema 5: Modelos de IA no se descargan

**Síntomas**:
```
Error pulling model deepseek-r1:14b
```

**Solución**:
```bash
# Verificar conectividad
ping ollama.ai

# Descargar manualmente
docker exec ollama ollama pull deepseek-r1:14b

# Verificar modelos instalados
docker exec ollama ollama list
```

### Problema 6: Servicios no responden

**Síntomas**: URLs no cargan o muestran errores 502/503

**Solución**:
```bash
# Verificar estado de servicios
make ps

# Reiniciar servicios problemáticos
docker compose -f envs/dev/docker-compose.yml restart [servicio]

# Ver logs para diagnosticar
docker compose -f envs/dev/docker-compose.yml logs [servicio]
```

### Problema 7: Problemas de permisos (Linux)

**Síntomas**:
```
Permission denied
```

**Solución**:
```bash
# Verificar que tu usuario está en el grupo docker
groups $USER

# Si no está, añadirlo:
sudo usermod -aG docker $USER
newgrp docker

# Arreglar permisos de datos
sudo chown -R $USER:$USER envs/dev/data/
```

### Comandos de Diagnóstico Útiles

```bash
# Ver uso de recursos
docker stats

# Ver logs de todos los servicios
make logs

# Ver detalles de red Docker
docker network ls
docker network inspect iadoc_default

# Ver volúmenes de datos
docker volume ls

# Información del sistema Docker
docker system info
```

---

## 🗑️ Desinstalación

### Desinstalación Completa

```bash
# Detener todos los servicios
make down

# Eliminar todos los datos (⚠️ IRREVERSIBLE)
make clean

# Eliminar imágenes Docker
docker rmi $(docker images | grep iadoc | awk '{print $3}')

# Eliminar volúmenes
docker volume rm $(docker volume ls | grep iadoc | awk '{print $2}')

# Eliminar redes
docker network rm iadoc_default

# Eliminar directorio del proyecto
cd ..
rm -rf iaDoc
```

### Desinstalación Parcial (Mantener Datos)

```bash
# Solo detener servicios
make down

# Eliminar solo imágenes (mantener datos)
docker rmi $(docker images | grep iadoc | awk '{print $3}')
```

### Backup Antes de Desinstalar

```bash
# Exportar datos de AppFlowy
make appflowy-export

# Exportar workflows de N8N
make n8n-export-workflows
make n8n-export-credentials

# Crear backup manual de datos importantes
cp -r envs/dev/data/ backup-iadoc-$(date +%Y%m%d)/
```

---

## 📞 Soporte de Instalación

### Información a Recopilar Antes de Solicitar Ayuda

```bash
# Información del sistema
uname -a
docker --version
docker compose version

# Estado de servicios
make ps > estado-servicios.txt

# Logs recientes
make logs > logs-instalacion.txt

# Uso de recursos
docker stats --no-stream > uso-recursos.txt
```

### Canales de Soporte

- **Email**: dev@alteriaautomation.com
- **GitHub Issues**: https://github.com/DevAlteria/iaDoc/issues
- **Documentación**: `docs/Manual de usuario.md`

### Información a Incluir en Solicitudes de Soporte

1. **Sistema operativo** y versión
2. **Versiones de Docker** y Docker Compose
3. **Paso donde falló** la instalación
4. **Mensaje de error completo**
5. **Logs relevantes** (usar los comandos de arriba)
6. **Especificaciones de hardware**

---

## 📋 Lista de Verificación Post-Instalación

### ✅ Servicios Básicos
- [ ] Docker Desktop ejecutándose
- [ ] Todos los contenedores en estado "Up"
- [ ] Puertos 80, 5678, 7869, 8080 accesibles
- [ ] URLs principales cargan correctamente

### ✅ Funcionalidades de IA
- [ ] Modelos de Ollama descargados (deepseek-r1:14b, nomic-embed-text, all-minillm)
- [ ] Open WebUI responde a consultas básicas
- [ ] Chat funciona en español
- [ ] Subida de archivos PDF funciona

### ✅ Automatización
- [ ] N8N accesible y configurado
- [ ] Workflows preinstalados visibles
- [ ] Credenciales configuradas automáticamente
- [ ] Prueba de workflow simple exitosa

### ✅ Colaboración
- [ ] AppFlowy accesible
- [ ] Registro de usuario exitoso
- [ ] Creación de documento funciona
- [ ] Edición en tiempo real funciona

### ✅ Almacenamiento
- [ ] MinIO accesible con credenciales por defecto
- [ ] PostgreSQL funcionando (visible en logs)
- [ ] Redis operativo (cache funcionando)
- [ ] Datos persistentes entre reinicios

### ✅ Configuración de Seguridad
- [ ] Contraseñas por defecto cambiadas
- [ ] Usuarios administrativos creados
- [ ] Acceso controlado configurado
- [ ] Backup inicial realizado

---

<div align="center">

**Guía de Instalación iaDoc v1.0**

*Desarrollado por [Alteria Automation SL](https://alteriaautomation.com)*

*Financiado por la Unión Europea - Programa PERTE*

---

*Si esta guía te fue útil, por favor considera contribuir al proyecto en GitHub*

*Última actualización: Julio 2025*

</div>
