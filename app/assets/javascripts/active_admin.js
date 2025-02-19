//= require active_admin/base
//= require tinymce
document.addEventListener('DOMContentLoaded', function() {
    if (typeof(tinymce) !== "undefined") {
      tinymce.init({
        selector: '.tinymce',
        plugins: 'advlist autolink lists link image charmap print preview anchor',
        toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright | outdent indent | link image',
        height: 300
      });
    }
  });
  