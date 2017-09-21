$(document).on("change", ".update-quantity", function(e){
  var quantity = $(this).val();
  var productId = $(this).closest('tr').attr('id');
  $.ajax({
      url: '/carts/add_to_cart',
      method: 'GET',
      data: { product_id: productId, quantity: quantity }
    }).success(function (data) {
      console.log(data);
    }).error(function (data) {
      console.log(data);
    })
})