window.addEventListener('load', function(){
  const park_price = document.getElementById("park-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  park_price.addEventListener('input', function(){
  let fee = this.value / 10;
  let gain = this.value - fee
  add_tax_price.textContent = fee
  profit.textContent = gain
  })
  })