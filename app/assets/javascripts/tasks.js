document.addEventListener('turbolinks:load', function() {
    document.querySelectorAll('td').forEach(function(td) {
        td.addEventListener('mouseover', function(e) {
            e.currentTarget.style.backgroundColor = '#edf';
        });

        td.addEventListener('mouseout', function(e) {
            e.currentTarget.style.backgroundColor = '';
        });
    });
}); 


