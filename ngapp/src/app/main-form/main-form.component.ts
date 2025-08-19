import { Component, OnInit } from '@angular/core';
import { SearchComponent } from '../search/search.component';
import { FormControl, ReactiveFormsModule  } from '@angular/forms';
import { MyService } from '../my-service.service';
import { User } from '../shared/user.model';

class TestUser implements User {
  constructor(public name: string, public email: string) {}
}

@Component({
  selector: 'app-main-form',
  imports: [ SearchComponent, ReactiveFormsModule],
  templateUrl: './main-form.component.html',
  styleUrl: './main-form.component.scss'
})
export class MainFormComponent implements OnInit {
  resultControl = new FormControl('');
  miscControl = new FormControl('');

  myTestUser1 : User = { name: "DR", email: "" };
  myTestUser2 : TestUser = { name: "DR", email: "" };
  myTestUser3 : any = { name: "DR", email: "" };
  myTestUser4 : TestUser = new TestUser("DR", "");

  constructor (private myService : MyService) {

    // Note while the others match the shape of TestUser, only myTestUser4 is an instance
    let instances : string[] = [];
    if (this.myTestUser1 instanceof TestUser) { instances.push("myTestUser1"); } 
    if (this.myTestUser2 instanceof TestUser) { instances.push("myTestUser2"); } 
    if (this.myTestUser3 instanceof TestUser) { instances.push("myTestUser3"); } 
    if (this.myTestUser4 instanceof TestUser) { instances.push("myTestUser4"); } 
    console.log("Instances of TestUser: " + instances.join(','))
  }

  ngOnInit(): void {
    let message = this.myService.getMessage();
    console.log("Init: " + message);
    this.miscControl.setValue(message);
  }

  handleValue(data: string) {
    console.log('Received:', data);
    this.resultControl.setValue(data);
  }
}
