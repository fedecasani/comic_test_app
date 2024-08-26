# ComicApp

ComicApp es una aplicación de cómics desarrollada en Flutter que permite explorar y visualizar una lista de cómics, así como obtener detalles específicos sobre cada uno. La aplicación utiliza BLoC para la gestión del estado y Hive para el almacenamiento local.

## Características
- Visualización de Lista de Cómics: Muestra una lista de cómics con sus detalles básicos.
- Detalles del Cómic: Permite ver información detallada sobre un cómic específico.
- Carga y Almacenamiento Local: Utiliza Hive para almacenar los cómics localmente y manejar el acceso offline.
- Navegación: Utiliza BLoC para la gestión del estado y la navegación entre pantallas.

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
3. Configura Hive: Asegúrate de tener el adaptador de Hive registrado en tu proyecto. Esto se hace automáticamente en el archivo `main.dart`.

4. Configuración de API:
    - Abre el archivo `lib/data/repositories/comic_repository.dart`.
    - Reemplaza `apiKey` con tu propia clave de API de Comic Vine:
    ```dart
    final String apiKey = "TU_API_KEY_AQUI";
    ```

## Ejecución
Para ejecutar la aplicación en un emulador o dispositivo físico, usa el siguiente comando:
```bash
flutter run
```

## Estructura del Proyecto

- **blocs/**: Contiene la lógica de estado utilizando BLoC.
- **data/models/**: Contiene los modelos de datos y adaptadores de Hive.
- **data/repositories/**: Contiene los repositorios para la obtención de datos.
- **screens/**: Contiene las pantallas principales de la aplicación.
- **widgets/**: Contiene los widgets personalizados utilizados en la aplicación.
- **main.dart**: Configuración inicial y punto de entrada de la aplicación.

## Contribuciones

Si deseas contribuir al proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama:
    ```bash
    git checkout -b mi-nueva-caracteristica
    ```
3. Realiza tus cambios y haz commit:
    ```bash
    git commit -am 'Añadí nueva característica'
    ```
4. Envía tus cambios:
    ```bash
    git push origin mi-nueva-caracteristica
    ```
5. Abre un pull request.

## Contacto

Si tienes alguna pregunta o comentario, puedes contactarme [fedecasani@gmail.com](mailto:fedecasani@gmail.com).
