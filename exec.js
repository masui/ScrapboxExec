//
// main part
//

// called from exec_bg.js
chrome.runtime.onMessage.addListener(function(req, sender, sendResponse) {
    file = $('.lines .code-block-start a').eq(0).text(); // get the first filename of code blocks in a Scrapbox page
    url = '/api/code' + location.pathname + '/' + file;  // generate a URL for getting the code

    a = $('<script>');
    a.attr('src',url);
    $('body').append(a);
});
