$('.register').each(function(i){
    $(this).click(function(){
        $('.registerform').addClass('registerform-active');
        $('.login').css('background-color','#A9E2F3');
        $('.register').css('color','#A9E2F3');
    });
});
$('.login').each(function(i){
    $(this).click(function(){
        $('.registerform').removeClass('registerform-active');
        $('.register').css('background-color','#0B4C5F');
    });
});

