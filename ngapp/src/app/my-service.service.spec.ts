import { TestBed } from '@angular/core/testing';
import { MyService } from './my-service.service';

describe('MyServiceService', () => {
  let service: MyService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MyService);
  });

  it('Hello from MyService', () => {
    expect(service).toBeTruthy();
  });
});
