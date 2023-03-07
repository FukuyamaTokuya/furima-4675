const calPrice = () => {
  const itemPrice=document.getElementById("item-price");
  const priceVal = itemPrice.value;
  const marginFee = document.getElementById("add-tax-price"); 
  const profitFee = document.getElementById("profit");
  const valueMarginFee = Math.floor(priceVal*0.1);
  const valueProfitFee = Math.floor(priceVal - valueMarginFee )
  marginFee.innerHTML = valueMarginFee
  profitFee.innerHTML = valueProfitFee
}

function price(){
  const itemPrice=document.getElementById("item-price");
  calPrice()
  itemPrice.addEventListener("keyup", () =>{
    calPrice();
  })
}

window.addEventListener('load',price)
