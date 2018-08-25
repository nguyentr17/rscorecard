context('sc_get')

test_that('Errors for non-init()', {
    expect_error(sc_get(),
                 'Chain not properly initialized. Be sure to start with sc_init().')
})

## not on CRAN -----------------------------------

test_that('Request doesn\'t match expected', {
    check_api()

    df1 <- dplyr::tibble('unitid' = 191515L, 'year' = 2013)

    df2 <- sc_init() %>%
        sc_filter(region == 2, ccbasic == 21, locale == 41) %>%
        sc_select(unitid) %>%
        sc_year(2013) %>%
        sc_get()

    expect_equal(df1, df2)

})

test_that('Debug doesn\'t return string', {
    check_api()

    out <- sc_init() %>%
                  sc_filter(region == 2, ccbasic == 21, locale == 41) %>%
                  sc_select(unitid) %>%
                  sc_year(2013) %>%
                  sc_get(debug = TRUE)

    call <- 'https://api.data.gov/ed/collegescorecard/v1/' %+%
        'schools.json?school.region_id=2&school.carnegie_basic' %+%
        '=21&school.locale=41&_fields=id&_page=0&_per_page=100&' %+%
        'api_key=<...HIDDEN...>'

    expect_equal(out, call)
})
