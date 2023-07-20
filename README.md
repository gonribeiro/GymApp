# GymApp - Flutter101

Meu primeiro projeto em Flutter.

# Estudo Inicial - Passo a passo para criação de um novo projeto FLutter utilizando o Firebase
## Instalando dependências no computador

Realizar apenas se nunca tiver feito no computador. Já tendo feito alguma vez, não é necessário repetir pois essas são instalações globais.

- Instalar o NodeJS LTS (https://nodejs.org/en);

- Instalar as dependências do firebase globalmente no PC (https://firebase.google.com/docs/cli?hl=pt-br);
```
npm install -g firebase-tools
```

- Realizar login no firebase com uma conta Google;
```
firebase login
```

- Instalar dependencia do flutter para utilização do firebase;
```
dart pub global activate flutterfire_cli
```

## Etapas do projeto

- Criar projeto:
```
flutter create --project-name gymapp --platform android --org com.gymapp ./gymapp
```

- Adicionar a dependência firebase-core:
```
flutter pub add firebase_core
```

Crie um projeto no Firebase (https://firebase.google.com/);

- Conectar ao firebase;
```
flutterfire configure

# Nas opções que aparecem:
1- Selecionar o projeto criado anteriormente;
2- Selecionar a opção Android;
```

- Instalar a dependência de autenticação do firebase
```
flutter pub add firebase_auth
```

- Após instalar qualquer nova dependência do firebase, execute abaixo selecionando o mesmo projeto:
```
flutterfire configure
```

- Na pasta android\app\build.gradle, altere:
```
defaultConfig {
    ...
    minSdkVersion 19
    targetSdkVersion flutter.targetSdkVersion
    versionCode flutterVersionCode.toInteger()
    versionName flutterVersionName
    multiDexEnabled true
}
```

- Demais etapas são em código, aqui não exemplificado.

- Adicionar no gitignore:
```
android/app/google-services.json
ios/firebase_app_id_file.json
ios/Runner/GoogleService-Info.plist
lib/firebase_options.dart
```

- Em pubspec.yaml > assets, alterar: (disponibiliza todos os arquivos dentro da pasta assets para o projeto)
```
# assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg

para:

assets:
    - assets/
```
