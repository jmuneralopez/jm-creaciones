import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-contact',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './contact.html',
  styleUrl: './contact.scss'
})
export class ContactComponent {  // ← Nombre cambiado
  formData = {
    nombre: '',
    telefono: '',
    email: '',
    categoria: '',
    mensaje: '',
    acepto: false
  };

  submitMessage: string = '';
  submitSuccess: boolean = false;

  onSubmit(): void {
    console.log('Formulario enviado:', this.formData);
    
    this.submitSuccess = true;
    this.submitMessage = '¡Gracias por contactarnos! Te responderemos pronto.';
    
    setTimeout(() => {
      this.submitMessage = '';
      this.resetForm();
    }, 3000);
  }

  resetForm(): void {
    this.formData = {
      nombre: '',
      telefono: '',
      email: '',
      categoria: '',
      mensaje: '',
      acepto: false
    };
  }
}