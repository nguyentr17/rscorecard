context('sc_select')

## dummy init list -------------------------------

dil <- list('dfvars' = TRUE,
            'select' = NULL,
            'filter' = NULL,
            'zip' = NULL,
            'year' = 2013)

test_that('Errors for non-init()', {
    expect_error(sc_select(unitid),
                 'Chain not properly initialized. Be sure to start with sc_init().')
})

test_that('Errors for blank', {
    expect_error(sc_select(dil),
                 'Incomplete select! You must select at least one variable.')
})


test_that('Error for bad variable names', {
    expect_error(sc_select(dil, uniti))
})

## not on CRAN -----------------------------------

test_that('Selected variables not the same', {
    check_api()
    df1 <- sc_init() %>%
        sc_filter(region == 2, ccbasic == 21, locale == 41) %>%
        sc_select(unitid, stabbr) %>%
        sc_year(2013) %>%
        sc_get()

    vars <- c('unitid', 'stabbr')
    df2 <- sc_init() %>%
        sc_filter(region == 2, ccbasic == 21, locale == 41) %>%
        sc_select_(vars) %>%
        sc_year(2013) %>%
        sc_get()

    expect_equal(df1, df2)
})
