import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

interface Product {
  id: number;
  name: string;
  description: string;
  category: string;
  image: string;
}

@Component({
  selector: 'app-products',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './products.html',
  styleUrl: './products.scss'
})
export class ProductsComponent implements OnInit {  // ← Nombre cambiado
  filterCategory: string = 'all';
  allProducts: Product[] = [
    {
      id: 1,
      name: 'Camiseta Personalizada',
      description: 'Diseños únicos en sublimación de alta calidad',
      category: 'sublimacion',
      image: 'https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=Camiseta'
    },
    {
      id: 2,
      name: 'Mug Personalizado',
      description: 'Tazas con tus diseños favoritos',
      category: 'sublimacion',
      image: 'https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=Mug'
    },
    {
      id: 3,
      name: 'Termo Sublimado',
      description: 'Mantén tus bebidas frías o calientes',
      category: 'sublimacion',
      image: 'https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=Termo'
    },
    {
      id: 4,
      name: 'Decoración Navideña',
      description: 'Artículos únicos para esta temporada',
      category: 'navidad',
      image: 'https://via.placeholder.com/300x200/E74C3C/FFFFFF?text=Navidad'
    },
    {
      id: 5,
      name: 'Pijama Personalizada',
      description: 'Comodidad y estilo en una sola prenda',
      category: 'pijamas',
      image: 'https://via.placeholder.com/300x200/4ECDC4/FFFFFF?text=Pijama'
    },
    {
      id: 6,
      name: 'Mantel Decorativo',
      description: 'Manteles personalizados para tu mesa',
      category: 'decoracion',
      image: 'https://via.placeholder.com/300x200/FFE66D/333333?text=Mantel'
    }
  ];

  filteredProducts: Product[] = [];

  ngOnInit(): void {
    this.filteredProducts = this.allProducts;
  }

  filterByCategory(category: string): void {
    this.filterCategory = category;
    
    if (category === 'all') {
      this.filteredProducts = this.allProducts;
    } else {
      this.filteredProducts = this.allProducts.filter(product => product.category === category);
    }
  }

  handleImageError(event: Event): void {
    const img = event.target as HTMLImageElement;
    img.src = 'https://via.placeholder.com/300x200?text=Producto';
  }
}
