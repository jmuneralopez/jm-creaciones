# ================================================================
# CREAR COMPONENTES - JM CREACIONES (VERSION CORREGIDA)
# ================================================================

Write-Host "Creando codigo de componentes..." -ForegroundColor Cyan

# 1. Crear carpetas
New-Item -ItemType Directory -Force -Path "src\app\components\header" | Out-Null
New-Item -ItemType Directory -Force -Path "src\app\components\footer" | Out-Null

# ================================================================
# HEADER COMPONENT (TypeScript)
# ================================================================
$headerTS = @(
    "import { Component } from '@angular/core';",
    "import { CommonModule } from '@angular/common';",
    "import { RouterLink, RouterLinkActive } from '@angular/router';",
    "",
    "@Component({",
    "  selector: 'app-header',",
    "  standalone: true,",
    "  imports: [CommonModule, RouterLink, RouterLinkActive],",
    "  templateUrl: './header.component.html',",
    "  styleUrl: './header.component.scss'",
    "})",
    "export class HeaderComponent {",
    "  isMobileMenuOpen = false;",
    "",
    "  toggleMobileMenu(): void {",
    "    this.isMobileMenuOpen = !this.isMobileMenuOpen;",
    "  }",
    "",
    "  closeMobileMenu(): void {",
    "    this.isMobileMenuOpen = false;",
    "  }",
    "}"
)
$headerTS -join "`r`n" | Out-File -FilePath "src\app\components\header\header.component.ts" -Encoding utf8

# ================================================================
# HEADER COMPONENT (HTML)
# ================================================================
# NOTA: Dentro de estas lineas, usamos '' (doble comilla simple) cuando
# necesitamos escribir una comilla simple literal.
$headerHTML = @(
    '<header class="header">',
    '  <div class="header__container">',
    '    <a routerLink="/" class="header__logo">',
    '      <span class="header__logo-text">JM <span>Creaciones</span></span>',
    '    </a>',
    '    <nav class="header__nav">',
    '      <a routerLink="/" routerLinkActive="header__link--active" [routerLinkActiveOptions]="{exact: true}" class="header__link">Inicio</a>',
    '      <a routerLink="/productos" routerLinkActive="header__link--active" class="header__link">Productos</a>',
    '      <a routerLink="/nosotros" routerLinkActive="header__link--active" class="header__link">Nosotros</a>',
    '      <a routerLink="/contacto" routerLinkActive="header__link--active" class="header__link">Contacto</a>',
    '    </nav>',
    '    <a routerLink="/contacto" class="header__cta">Cotizar</a>',
    '    <button class="header__mobile-toggle" (click)="toggleMobileMenu()">',
    '      <i class="fas" [ngClass]="isMobileMenuOpen ? ''fa-times'' : ''fa-bars''"></i>',
    '    </button>',
    '  </div>',
    '  <div class="header__mobile-menu" [ngClass]="{''header__mobile-menu--active'': isMobileMenuOpen}">',
    '    <a routerLink="/" routerLinkActive="header__link--active" [routerLinkActiveOptions]="{exact: true}" class="header__link" (click)="closeMobileMenu()">Inicio</a>',
    '    <a routerLink="/productos" routerLinkActive="header__link--active" class="header__link" (click)="closeMobileMenu()">Productos</a>',
    '    <a routerLink="/nosotros" routerLinkActive="header__link--active" class="header__link" (click)="closeMobileMenu()">Nosotros</a>',
    '    <a routerLink="/contacto" routerLinkActive="header__link--active" class="header__link" (click)="closeMobileMenu()">Contacto</a>',
    '  </div>',
    '</header>'
)
$headerHTML -join "`r`n" | Out-File -FilePath "src\app\components\header\header.component.html" -Encoding utf8

# ================================================================
# FOOTER COMPONENT (TypeScript)
# ================================================================
$footerTS = @(
    "import { Component } from '@angular/core';",
    "import { CommonModule } from '@angular/common';",
    "import { RouterLink } from '@angular/router';",
    "",
    "@Component({",
    "  selector: 'app-footer',",
    "  standalone: true,",
    "  imports: [CommonModule, RouterLink],",
    "  templateUrl: './footer.component.html',",
    "  styleUrl: './footer.component.scss'",
    "})",
    "export class FooterComponent {",
    "  currentYear = new Date().getFullYear();",
    "}"
)
$footerTS -join "`r`n" | Out-File -FilePath "src\app\components\footer\footer.component.ts" -Encoding utf8

# ================================================================
# FOOTER COMPONENT (HTML)
# ================================================================
$footerHTML = @(
    '<footer class="footer">',
    '  <div class="footer__container">',
    '    <div class="footer__content">',
    '      <div class="footer__section">',
    '        <h3 class="footer__section-title">JM Creaciones</h3>',
    '        <p class="footer__section-text">Creamos productos personalizados unicos.</p>',
    '        <div class="footer__social">',
    '          <a href="#" class="footer__social-link"><i class="fab fa-facebook-f"></i></a>',
    '          <a href="#" class="footer__social-link"><i class="fab fa-instagram"></i></a>',
    '          <a href="https://wa.me/573001234567" class="footer__social-link"><i class="fab fa-whatsapp"></i></a>',
    '        </div>',
    '      </div>',
    '      <div class="footer__section">',
    '        <h3 class="footer__section-title">Enlaces</h3>',
    '        <div class="footer__links">',
    '          <a routerLink="/">Inicio</a>',
    '          <a routerLink="/productos">Productos</a>',
    '          <a routerLink="/nosotros">Nosotros</a>',
    '          <a routerLink="/contacto">Contacto</a>',
    '        </div>',
    '      </div>',
    '      <div class="footer__section">',
    '        <h3 class="footer__section-title">Contacto</h3>',
    '        <div class="footer__contact">',
    '          <div class="footer__contact-item"><i class="fas fa-phone"></i><span>+57 300 123 4567</span></div>',
    '          <div class="footer__contact-item"><i class="fas fa-envelope"></i><span>info@jmcreaciones.com</span></div>',
    '        </div>',
    '      </div>',
    '    </div>',
    '    <div class="footer__bottom">',
    '      <p>&copy; {{ currentYear }} <a routerLink="/">JM Creaciones</a>. Todos los derechos reservados.</p>',
    '    </div>',
    '  </div>',
    '</footer>'
)
$footerHTML -join "`r`n" | Out-File -FilePath "src\app\components\footer\footer.component.html" -Encoding utf8

Write-Host "[OK] Header y Footer creados correctamente" -ForegroundColor Green