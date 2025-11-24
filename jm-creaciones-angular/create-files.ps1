# ================================================================
# SCRIPT PARA CREAR ARCHIVOS DE CÓDIGO - JM CREACIONES
# ================================================================

Write-Host "📝 Creando archivos de código..." -ForegroundColor Cyan

# ================================================================
# ACTUALIZAR main.ts
# ================================================================
@'
import 'zone.js';

import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { AppComponent } from './app/app.component';

bootstrapApplication(AppComponent, appConfig)
  .catch((err) => console.error(err));
'@ | Out-File -FilePath src\main.ts -Encoding utf8

# ================================================================
# ACTUALIZAR app.config.ts
# ================================================================
@'
import { ApplicationConfig, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';
import { provideClientHydration } from '@angular/platform-browser';

export const appConfig: ApplicationConfig = {
  providers: [
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideClientHydration()
  ]
};
'@ | Out-File -FilePath src\app\app.config.ts -Encoding utf8

# ================================================================
# CREAR app.routes.ts
# ================================================================
@'
import { Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { ProductsComponent } from './pages/products/products.component';
import { ContactComponent } from './pages/contact/contact.component';
import { AboutComponent } from './pages/about/about.component';

export const routes: Routes = [
  { path: '', component: HomeComponent, title: 'Inicio - JM Creaciones' },
  { path: 'productos', component: ProductsComponent, title: 'Productos - JM Creaciones' },
  { path: 'contacto', component: ContactComponent, title: 'Contacto - JM Creaciones' },
  { path: 'nosotros', component: AboutComponent, title: 'Nosotros - JM Creaciones' },
  { path: '**', redirectTo: '', pathMatch: 'full' }
];
'@ | Out-File -FilePath src\app\app.routes.ts -Encoding utf8

# ================================================================
# ACTUALIZAR app.component.ts
# ================================================================
@'
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, HeaderComponent, FooterComponent],
  template: `
    <app-header></app-header>
    <router-outlet></router-outlet>
    <app-footer></app-footer>
    <a href="https://wa.me/573001234567" class="btn-whatsapp" target="_blank" rel="noopener">
      <i class="fab fa-whatsapp"></i>
    </a>
  `,
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'jm-creaciones-angular';
}
'@ | Out-File -FilePath src\app\app.component.ts -Encoding utf8

# ================================================================
# ACTUALIZAR index.html
# ================================================================
@'
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>JM Creaciones y Diseño</title>
  <base href="/">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="/favicon.ico">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
  <app-root></app-root>
</body>
</html>
'@ | Out-File -FilePath src\index.html -Encoding utf8

Write-Host "✅ Archivos principales creados" -ForegroundColor Green
Write-Host "`n📝 Ahora ejecuta: .\create-components.ps1" -ForegroundColor Yellow