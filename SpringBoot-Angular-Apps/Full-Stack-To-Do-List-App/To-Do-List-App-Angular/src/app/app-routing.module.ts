import { NgModule } from '@angular/core';
//import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';

//import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';
import { ProductDetailComponent } from './product-detail/product-detail.component';

const routes: Routes = [
  //{ path: '', component: HomeComponent },
  { path: 'about', component: AboutComponent },
  { path: 'contact', component: ContactComponent },
  // dynamic routing
  { path: 'product/:id', component: ProductDetailComponent },
  // Wildcard route for a 404 page
  { path: '**', redirectTo: '' },
];

// @NgModule({
//   declarations: [],
//   imports: [CommonModule],
// })

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
