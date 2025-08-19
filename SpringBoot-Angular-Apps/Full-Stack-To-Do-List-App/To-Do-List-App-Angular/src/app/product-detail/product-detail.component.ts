import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.component.html',
})
export class ProductDetailComponent implements OnInit {
  productId: string | null = null;

  constructor(private route: ActivatedRoute) {}

  // note only runs once
  ngOnInit() {
    // Note the following line will only run once, so using different product ids
    // won;t result in the page content changing:
    //  this.productId = this.route.snapshot.paramMap.get('id');
    // However if subscribe to the paramMap, then the Observer Function (similar to
    // a lambda in C#) will run when the product id changes.
    this.route.paramMap.subscribe((params) => {
      this.productId = params.get('id');
      console.log('Now viewing product:', this.productId);
      // Optionally re-fetch data here
    });
  }
}
