# ================================================================
# SCRIPT DE INSTALACIÓN COMPLETA - JM CREACIONES Y DISEÑO
# ================================================================

Write-Host "🚀 Iniciando configuración del proyecto JM Creaciones..." -ForegroundColor Green

# Verificar que estamos en la carpeta correcta
$currentDir = Get-Location
if ($currentDir.Path -notlike "*jm-creaciones-angular*") {
    Write-Host "⚠️  ADVERTENCIA: Asegúrate de estar dentro de la carpeta jm-creaciones-angular" -ForegroundColor Yellow
    Write-Host "Ejecuta: cd jm-creaciones-angular" -ForegroundColor Yellow
    exit
}

# ================================================================
# 1. INSTALAR ZONE.JS
# ================================================================
Write-Host "`n📦 Instalando Zone.js..." -ForegroundColor Cyan
npm install zone.js

# ================================================================
# 2. CREAR ESTRUCTURA DE CARPETAS
# ================================================================
Write-Host "`n📁 Creando estructura de carpetas..." -ForegroundColor Cyan

New-Item -ItemType Directory -Force -Path src\styles\components | Out-Null
New-Item -ItemType Directory -Force -Path src\styles\layout | Out-Null
New-Item -ItemType Directory -Force -Path src\styles\utils | Out-Null
New-Item -ItemType Directory -Force -Path public\img\productos | Out-Null
New-Item -ItemType Directory -Force -Path public\img\banners | Out-Null
New-Item -ItemType Directory -Force -Path public\img\categorias | Out-Null

Write-Host "✅ Estructura de carpetas creada" -ForegroundColor Green

# ================================================================
# 3. GENERAR COMPONENTES
# ================================================================
Write-Host "`n🔨 Generando componentes..." -ForegroundColor Cyan

ng generate component components/header --standalone --skip-tests
ng generate component components/footer --standalone --skip-tests
ng generate component components/product-card --standalone --skip-tests
ng generate component pages/home --standalone --skip-tests
ng generate component pages/products --standalone --skip-tests
ng generate component pages/contact --standalone --skip-tests
ng generate component pages/about --standalone --skip-tests

Write-Host "✅ Componentes generados" -ForegroundColor Green

# ================================================================
# 4. CREAR ARCHIVOS SASS
# ================================================================
Write-Host "`n🎨 Creando archivos Sass..." -ForegroundColor Cyan

# _variables.scss
@'
$color-primary: #FF6B6B;
$color-secondary: #4ECDC4;
$color-accent: #FFE66D;
$color-dark: #2C3E50;
$color-light: #F7F9FC;
$color-white: #FFFFFF;
$color-gray: #95A5A6;
$color-gray-light: #ECF0F1;

$font-primary: 'Poppins', sans-serif;
$font-secondary: 'Roboto', sans-serif;

$spacing-xs: 0.5rem;
$spacing-small: 1rem;
$spacing-medium: 2rem;
$spacing-large: 4rem;
$spacing-xlarge: 6rem;

$border-radius: 8px;
$box-shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.1);
$box-shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
$box-shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.15);

$transition-speed: 0.3s;
$font-size-base: 1rem;
$font-size-small: 0.875rem;
$font-size-large: 1.25rem;
$font-size-xlarge: 1.5rem;
$font-size-xxlarge: 2rem;
$font-weight-regular: 400;
$font-weight-medium: 500;
$font-weight-bold: 700;

$breakpoint-sm: 768px;
$breakpoint-md: 992px;
$breakpoint-lg: 1200px;

$z-index-fixed: 1030;
'@ | Out-File -FilePath src\styles\utils\_variables.scss -Encoding utf8

# _mixins.scss
@'
@mixin respond-to($breakpoint) {
  @if $breakpoint == 'sm' {
    @media (min-width: #{$breakpoint-sm}) { @content; }
  }
  @else if $breakpoint == 'md' {
    @media (min-width: #{$breakpoint-md}) { @content; }
  }
  @else if $breakpoint == 'lg' {
    @media (min-width: #{$breakpoint-lg}) { @content; }
  }
}

@mixin flex-center {
  display: flex;
  justify-content: center;
  align-items: center;
}

@mixin flex-between {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

@mixin button-variant($bg-color, $text-color: $color-white) {
  background-color: $bg-color;
  color: $text-color;
  padding: $spacing-small $spacing-medium;
  border: none;
  border-radius: $border-radius;
  cursor: pointer;
  transition: all $transition-speed ease;
  text-decoration: none;
  display: inline-block;
  
  &:hover {
    background-color: darken($bg-color, 10%);
    transform: translateY(-2px);
    box-shadow: $box-shadow-md;
  }
}

@mixin generate-spacing($prefix, $property) {
  @each $size, $value in (
    'xs': $spacing-xs,
    'sm': $spacing-small,
    'md': $spacing-medium,
    'lg': $spacing-large,
    'xl': $spacing-xlarge
  ) {
    .#{$prefix}-#{$size} {
      #{$property}: $value;
    }
  }
}
'@ | Out-File -FilePath src\styles\utils\_mixins.scss -Encoding utf8

# _reset.scss
@'
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  font-size: 16px;
  scroll-behavior: smooth;
}

body {
  font-family: $font-secondary;
  color: $color-dark;
  line-height: 1.6;
  background-color: $color-light;
}

h1, h2, h3, h4, h5, h6 {
  font-family: $font-primary;
  font-weight: $font-weight-bold;
  line-height: 1.2;
  margin-bottom: $spacing-small;
}

a {
  color: $color-primary;
  text-decoration: none;
  transition: color $transition-speed ease;
  
  &:hover {
    color: darken($color-primary, 15%);
  }
}

img {
  max-width: 100%;
  height: auto;
  display: block;
}

ul, ol {
  list-style: none;
}
'@ | Out-File -FilePath src\styles\utils\_reset.scss -Encoding utf8

# Archivos vacíos
"" | Out-File -FilePath src\styles\components\_header.scss -Encoding utf8
"" | Out-File -FilePath src\styles\components\_footer.scss -Encoding utf8
"" | Out-File -FilePath src\styles\components\_cards.scss -Encoding utf8
"" | Out-File -FilePath src\styles\components\_buttons.scss -Encoding utf8
"" | Out-File -FilePath src\styles\layout\_grid.scss -Encoding utf8
"" | Out-File -FilePath src\styles\layout\_forms.scss -Encoding utf8

Write-Host "✅ Archivos Sass creados" -ForegroundColor Green

# ================================================================
# 5. MENSAJE FINAL
# ================================================================
Write-Host "¡Configuración completada!" -ForegroundColor Green
Write-Host "PRÓXIMOS PASOS:" -ForegroundColor Yellow
Write-Host "1. Ejecuta el segundo script: .\create-files.ps1" -ForegroundColor White
Write-Host "2. Luego ejecuta: ng serve --open" -ForegroundColor White
Write-Host "El proyecto estará listo en unos minutos..." -ForegroundColor Cyan