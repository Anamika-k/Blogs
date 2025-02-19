// Import Trix editor
import "trix";

// Import ActionText, which integrates Trix with Rails
import "@rails/actiontext";
import "../stylesheets/application"


import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';
//import "bootstrap"
//import "bootstrap.bundle.min.js";
import tinymce from 'tinymce';
import 'tinymce/themes/silver';
import 'tinymce/icons/default';
import 'tinymce/plugins/advlist';
import 'tinymce/plugins/autolink';
import 'tinymce/plugins/lists';
import 'tinymce/plugins/link';
import 'tinymce/plugins/image';
import 'tinymce/plugins/charmap';
import 'tinymce/plugins/print';
import 'tinymce/plugins/searchreplace';
import 'tinymce/plugins/table';
import 'tinymce/plugins/emoticons';
import 'tinymce/plugins/contextmenu';
import 'tinymce/plugins/paste';
import 'tinymce/plugins/fullscreen';
import 'tinymce/plugins/help';
import 'tinymce/plugins/wordcount';

document.addEventListener("DOMContentLoaded", function() {
    tinymce.init({
      selector: 'textarea#post_description',  // Target the textarea by its ID or class
      height: 500,
      menubar: true,
      plugins: [
        'advlist autolink lists link image charmap print preview hr anchor pagebreak',
        'searchreplace wordcount visualblocks visualchars code fullscreen',
        'insertdatetime media nonbreaking save table contextmenu directionality',
        'emoticons template paste textcolor colorpicker textpattern'
      ],
      toolbar: 'undo redo | formatselect | bold italic | alignleft aligncenter alignright alignjustify | outdent indent | bullist numlist | link image | emoticons',
      content_css: '//www.tiny.cloud/css/codepen.min.css'  // Optional, for styles
    });
  });
  