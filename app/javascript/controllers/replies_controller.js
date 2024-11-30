import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["replies", "count"]
  static values = { 
    count: Number,
    expanded: { type: Boolean, default: true }
  }

  connect() {
    this.countTarget.textContent = `${this.countValue} replies`
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
