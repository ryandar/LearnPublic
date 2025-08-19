import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { debounceTime, distinctUntilChanged } from 'rxjs/operators';

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html',
  styleUrls: ['./user-form.component.css'],
})
export class UserFormComponent {
  userForm: FormGroup;

  constructor(private fb: FormBuilder) {
    this.userForm = this.fb.group({
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
    });
  }

  ngOnInit() {
    this.userForm
      .get('email')
      ?.valueChanges.pipe(
        debounceTime(300), // Wait 300ms after user stops typing
        distinctUntilChanged() // Ignore if value hasn't changed
      )
      .subscribe((value) => {
        console.log('Searching for:', value);
        // Maybe call a service here...
      });
  }

  onSubmit(): void {
    if (this.userForm.valid) {
      console.log('Form Submitted:', this.userForm.value);
      alert('Form submitted!');
    } else {
      alert('Form is invalid. Please check the fields.');
    }
  }
}
