function price(){
  const itemPrice=document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () =>{
    const priceVal = itemPrice.value;
    const marginFee = document.getElementById("add-tax-price");
    const profitFee = document.getElementById("profit");
    const valueMarginFee = Math.floor(priceVal*0.1);
    const valueProfitFee = Math.floor(priceVal - valueMarginFee )
    marginFee.innerHTML = valueMarginFee
    profitFee.innerHTML = valueProfitFee
  })
}

window.addEventListener('load',price)