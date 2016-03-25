context('sc_key')

test_that('Bad key', {
    expect_error(sc_key(111111111111111111111111111111111111111111),
                 'API key must be character string of length 40')
    expect_error(sc_key('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
                 'API key must be character string of length 40')
})
