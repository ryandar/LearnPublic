import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root' // Makes the service available app-wide
})
export class MyService {
  constructor() {}

  getMessage(): string {
    return 'Hello from MyService!';
  }
}
