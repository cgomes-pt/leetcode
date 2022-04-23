var encode = function(longUrl) {
    console.log(longUrl)
    let buffer = new Buffer(longUrl);
    let base64 = buffer.toString('base64');
    console.log(base64)
    return `http://tinyurl.com/${base64}`;
    
};


var decode = function(shortUrl) {
    console.log(shortUrl)
    let encode = shortUrl.split('tinyurl.com/').pop();
    let buffer = new Buffer(encode,'base64');
    let base64 = buffer.toString('ascii');
    
    return base64;
};


console.log(decode(encode("http://badge.example.net/beginner.aspx?aftermath=achiever&actor=air")))