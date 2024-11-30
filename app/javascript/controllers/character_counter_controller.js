import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "counter"]
  static values = { maxLength: Number }
  
  connect() {
    this.updateCounter()
  }
  
  updateCounter() {
    const remaining = this.maxLengthValue - this.inputTarget.value.length
    this.counterTarget.textContent = remaining
    
    // Visual feedback when over limit
    if (remaining < 0) {
      this.counterTarget.style.color = '#ff4136'
    } else {
      this.counterTarget.style.color = '#536471'
    }
  }
}