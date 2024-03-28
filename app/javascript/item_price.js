const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {

    const inputValue = parseFloat(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    const addTaxValue = parseFloat(addTaxDom.innerHTML);
    const profitValue = document.getElementById("profit");
    profitValue.innerHTML = Math.floor(inputValue - addTaxValue)

  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);