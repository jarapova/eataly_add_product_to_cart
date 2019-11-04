require 'spec_helper'

feature 'Eataly - adding product to cart' do
  scenario 'Test example 1' do
    Capybara.page.driver.browser.manage.window.maximize

    visit 'https://www.eataly.net/eu_en/'

    #Click login and fill in login form
    find(:xpath, ta('eataly:home:loginBtn', "//button//strong[contains(text(), 'Login/Register')]")).click
    find(:xpath, ta('eataly:loginForm:emailField', "//input[contains(@id, 'mini-login')]")).set('arapova.jul2@gmail.com')
    find(:xpath, ta('eataly:loginForm:passField', "//input[contains(@id, 'mini-password')]")).set('1234Test@')
    find(:xpath, ta('eataly:loginForm:signInBtn', "//button//span[contains(text(), 'Sign in')]")).click

    #hover Food in navigation menu
    find(:xpath, ta('eataly:mainPage:foodNavMenu', "//ol[@class='nav-primary']//span[contains(text(), 'Food')]")).hover
    find(:xpath, ta('eataly:mainPage:foodNavMenu:pastaRiceCerealsLegumes', "//ol[@class='nav-primary']//span[contains(text(), 'Pasta, Rice, Cereals and Legumes')]")).hover
    find(:xpath, ta('eataly:mainPage:foodNavMenu:pasta', "//ol[@class='nav-primary']//span[text()='Pasta']")).click

    #Close cookie attention
    find(:xpath, ta('eataly:mainPage:closeCookies', "//a[@id='cc-approve-button-thissite']")).click

    #Add pasta in cart

    if page.has_xpath?("(//button[contains(@class, 'btn-cart')])[1]")
      find(:xpath, ta('eataly:productPage:addPastaInCart', "(//button[contains(@class, 'btn-cart')])[1]")).click
    else
      find(:xpath, ta('eataly:productPage:addMorePastaInCart', "(//button[contains(@class, 'button btn-update-cart up')])[1]")).click
    end

    #Go to Cart
    find(:xpath, ta('eataly:productPage:foodNavMenu:goToCartPage', "//div[@class='header']//a[contains(@id, 'header-mini-cart')]")).click

    # Click Proceed to checkout button
    find(:xpath, ta('eataly:productPage:proceedToCheckoutBtn', "//div[@class='header']//span[contains(text(), 'Proceeed to checkout')]")).click

    sleep 5

    # Click Master Pass payment
    find(:xpath, ta('eataly:checkoutPage:selectMasterPass', "//label[contains(text(), 'MasterPass')]")).click

    #Click BUY button
    find(:xpath, ta('eataly:checkoutPage:buyButton', "//button[contains(@class, 'btn-checkout')]")).click

    sleep 15

    # Set wallet information
    switch_to_frame(find(:xpath, "//iframe[@id='wallet']"))

    sleep 4

    find(:xpath, ta('eataly:walletFrame:phoneField', "//input[@id='phoneNumberother']")).set('730960589')
    find(:xpath, ta('eataly:walletFrame:passField', "//input[contains(@id, 'password')]")).set('135792')

    #enter in wallet
    find(:xpath, ta('eataly:walletFrame:enterBtn', "//button[contains(@id, 'btnSubmit')]")).click

    sleep 10

  end
end
