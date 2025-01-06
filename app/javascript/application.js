import "bootstrap"
import Rails from "@rails/ujs"
Rails.start()
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
