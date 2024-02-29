const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {

  const inputValue = parseFloat(priceInput.value);
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  const addTaxValue = parseFloat(addTaxDom.innerHTML);
  const profitValue = document.getElementById("profit");
  profitValue.innerHTML = inputValue - addTaxValue

});

