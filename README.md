# trueautomation-capybara-example

You must have installed TrueAutomation client, Ruby 2.3.0 or later.

## How to run test:

* Checkout the project

```
git clone https://github.com/shapovalovei/trueautomation-capybara.git
```

* Init the project, using `trueautomation init` command

* Install required dependencies

```bash
bundle install
```
* Run test

```bash
spec spec/features/example_spec.rb

prod client http://app.trueautomation.io/
trueautomation api-key ead06758-858c-4f90-bb98-7d5449432809
rspec spec/test_scenario/eataly_adding_product_to_cart.rb
