import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["replies", "count"]
  static values = { 
    count: Number,
    expanded: { type: Boolean, default: false },
    search: { type: Boolean, default: false }
  }

  connect() {
    // Start expanded if we're in search results
    if (this.searchValue) {
      this.expandedValue = true
    } else {
      this.expandedValue = false
      this.repliesTarget.classList.add("hidden")
    }
    
    this.updateCountText()
  }

  updateCountText() {
    if (this.expandedValue) {
      this.countTarget.textContent = `Hide replies`
    } else {
      this.countTarget.textContent = `Show ${this.countValue} replies`
    }
  }

  toggle() {
    this.expandedValue = !this.expandedValue
    this.repliesTarget.classList.toggle("hidden")
    
    if (this.expandedValue) {
      this.countTarget.textContent = `Hide replies`
    } else {
      this.countTarget.textContent = `Show ${this.countValue} replies`
    }
  }
}
