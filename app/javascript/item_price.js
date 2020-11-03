window.addEventListener('load', () => {
  console.log("hoge")
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(Number(inputValue) * 0.1);
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(Number(inputValue) * 0.9);
  })
});

