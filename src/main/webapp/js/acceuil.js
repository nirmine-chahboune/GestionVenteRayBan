$(document).ready(function() {
    // Get references to the search form, navbar, and slides
    const searchForm = $('.header .search-form');
    const navbar = $('.header .navbar');
    const slides = $('.home .slide');
    let index = 0; // Initialize the index variable to 0

    // Event handler for search button click
    $('#search-btn').click(function() {
        searchForm.toggleClass('active'); // Toggle the 'active' class of the search form
        navbar.removeClass('active'); // Remove the 'active' class from the navbar
    });

    // Event handler for menu button click
    $('#menu-btn').click(function() {
        navbar.toggleClass('active'); // Toggle the 'active' class of the navbar
        searchForm.removeClass('active'); // Remove the 'active' class from the search form
    });

    // Event handler for window scroll
    $(window).scroll(function() {
        searchForm.removeClass('active'); // Remove the 'active' class from the search form
        navbar.removeClass('active'); // Remove the 'active' class from the navbar
    });

    // Function to show the next slide
    function next() {
        slides.eq(index).removeClass('active'); // Remove the 'active' class from the current slide
        index = (index + 1) % slides.length; // Update the index to the next slide
        slides.eq(index).addClass('active'); // Add the 'active' class to the next slide
    }

    // Function to show the previous slide
    function prev() {
        slides.eq(index).removeClass('active'); // Remove the 'active' class from the current slide
        index = (index - 1 + slides.length) % slides.length; // Update the index to the previous slide
        slides.eq(index).addClass('active'); // Add the 'active' class to the previous slide
    }
});
