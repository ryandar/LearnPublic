import { Component, OnInit } from '@angular/core';
import { MyService } from '../my-service.service';

@Component({
  selector: 'app-my-component',
  imports: [],
  templateUrl: './my-component.component.html',
  styleUrl: './my-component.component.scss'
})
export class MyComponent implements OnInit {

  message: string = '';

  // Inject MyService using DI
  constructor(private myService: MyService) {}

  ngOnInit() : void {
    this.message = this.myService.getMessage();
  }
}
