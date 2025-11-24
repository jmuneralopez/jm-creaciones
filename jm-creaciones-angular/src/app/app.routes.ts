import { Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home';
import { ProductsComponent } from './pages/products/products';
import { ContactComponent } from './pages/contact/contact';    
import { AboutComponent } from './pages/about/about';  

export const routes: Routes = [
  { path: '', component: HomeComponent, title: 'Inicio - JM Creaciones' },
  { path: 'productos', component: ProductsComponent, title: 'Productos - JM Creaciones' },
  { path: 'contacto', component: ContactComponent, title: 'Contacto - JM Creaciones' },
  { path: 'nosotros', component: AboutComponent, title: 'Nosotros - JM Creaciones' },
  { path: '**', redirectTo: '', pathMatch: 'full' }
];