import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { delay } from 'rxjs/operators';

@Injectable({ providedIn: 'root' })
export class SearchService {
  search(term: string): Observable<string[]> {
    // Simulate an HTTP call with a delay
    const fakeResults = [`${term} Result 1`, `${term} Result 2`, `${term} Result 3`];
    return of(fakeResults).pipe(delay(500)); // simulate latency
  }
}
