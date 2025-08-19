// user-form.component.ts
import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators, ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  imports: [CommonModule, ReactiveFormsModule ],
})
export class UserFormComponent implements OnInit {
  userForm!: FormGroup;

  constructor(private fb: FormBuilder) {}

  ngOnInit() {
    this.userForm = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(3)]],
      email: ['',], // [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      gender: ['male'],
      terms: [false, Validators.requiredTrue]
    });
  }

  onSubmit() {
    if (this.userForm.valid) {
      console.log("console.log(this.userForm.value)=",  this.userForm.value);
    } else {
      this.userForm.markAllAsTouched();
    }
  }
}
