$(document).ready(function() {
    $('.collapser').click(function() {
        var $icon = $(this).find('i');
        $icon.toggleClass('rotate');
    });
});
