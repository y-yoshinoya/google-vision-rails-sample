// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//require("@rails/ujs").start()
//require("turbolinks").start()
//require("channels")
require("@rails/activestorage").start()
require('../../../app/assets/stylesheets/appstyle.scss')
require('jquery')
import 'bootstrap'
import 'crud'
import 'crud/fontawesome'
import 'crud/coreui'
import 'bootstrap-filestyle2'
import 'flatpickr'
import { Japanese } from "flatpickr/dist/l10n/ja.js"
flatpickr.localize(Japanese)
import GoogleCloudVisionUtils from './google_cloud_vision'

window.GoogleCloudVisionUtils = GoogleCloudVisionUtils;

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
