import { Component, OnInit, OnDestroy, Output, EventEmitter } from '@angular/core';
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { debounceTime, distinctUntilChanged, filter, switchMap } from 'rxjs/operators';
import { CommonModule } from '@angular/common';
import { SearchService } from '../search.service';
import { Subscription } from 'rxjs';

@Component({
  standalone: true,
  selector: 'app-search',
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './search.component.html',
})
export class SearchComponent implements OnInit, OnDestroy {

  @Output() valueEmitted = new EventEmitter<string>();

  searchControl = new FormControl('');
  private subscription = new Subscription();
  results: string[] = [];

  constructor(private searchService: SearchService) {}

  ngOnInit(): void {
    const sub = this.searchControl.valueChanges.pipe(
      debounceTime(300),
      distinctUntilChanged(),
      filter(value => value!.length > 2),
      switchMap(term => this.searchService.search(term!))
    ).subscribe(results => {
      console.log('Search results:', results);
      this.results = results;
    });

    this.subscription.add(sub);
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }

  sendData() {
    this.valueEmitted.emit(this.searchControl.value ?? '');
  }
}

