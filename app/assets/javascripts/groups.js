$(document).on("click", ".add_member", function() {
  var association = $(this).attr("name");
  var regexp = new RegExp("new_" + association, "g");
  var new_id = new Date().getTime();
  $(this).parent().before(window[association + "_form"].replace(regexp, new_id));
  return false;
});

$(document).on("click", ".remove", function() {
  $(this).closest(".field").remove();
  return false;
});

function addForm() {
  var association = "members";
  var regexp = new RegExp("new_" + association, "g");
  var new_id = new Date().getTime();
  $(".add_member").parent().before(window[association + "_form"].replace(regexp, new_id));
  $(".correct-choose").hide();
  $(".remove-choose").hide();
}


