# ComicApp

ComicApp es una aplicación de cómics desarrollada en Flutter que permite explorar y visualizar una lista de cómics, así como obtener detalles específicos sobre cada uno. La aplicación utiliza BLoC para la gestión del estado y Hive para el almacenamiento local.

## Características

- **Visualización de Lista de Cómics**: Muestra una lista de cómics con sus detalles básicos.
- **Detalles del Cómic**: Permite ver información detallada sobre un cómic específico.
- **Carga y Almacenamiento Local**: Utiliza Hive para almacenar los cómics localmente y manejar el acceso offline.
- **Navegación**: Utiliza BLoC para la gestión del estado y la navegación entre pantallas.

## Requisitos

- Flutter SDK
- Dart SDK
- Hive y Hive Flutter
- Flutter BLoC
- HTTP

## Instalación

1. Clona el repositorio:

    ```bash
    git clone https://github.com/tu_usuario/comicapp.git
    cd comicapp
    ```

2. Instala las dependencias:

    ```bash
    flutter pub get
    ```

3. Configura Hive:

    Asegúrate de tener el adaptador de Hive registrado en tu proyecto. Esto se hace automáticamente en el archivo `main.dart`.

## Configuración de API

1. Abre el archivo `lib/data/repositories/comic_repository.dart`.

2. Reemplaza `apiKey` con tu propia clave de API de Comic Vine:

    ```dart
    final String apiKey = "TU_API_KEY_AQUI";
    ```

## Ejecución

Para ejecutar la aplicación en un emulador o dispositivo físico, usa el siguiente comando:

```bash
flutter run
