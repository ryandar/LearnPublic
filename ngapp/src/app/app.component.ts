import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { MyComponent } from "./my-component/my-component.component";
import { SearchComponent } from "./search/search.component";
import { UserFormComponent } from "./user-form/user-form.component";
import { MainFormComponent } from "./main-form/main-form.component";
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, CommonModule, MyComponent, SearchComponent, UserFormComponent, MainFormComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'ngapp';
}
