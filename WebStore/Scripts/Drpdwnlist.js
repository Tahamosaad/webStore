
    $(document).ready(function () {
        $("#SubCatID").prop("disabled", true);
        $("#MainCatID").change(function () {
            if ($("#MainCatID").val() != "Electronics") {
                var options = {};
                options.url = "/Products/GetSubCat";
                options.type = "POST";
                options.data = JSON.stringify({ MainCatID: $("#MainCatID").val() });
                options.dataType = "json";
                options.contentType = "application/json";
                options.success = function (subcat) {

                    $("#SubCatID").empty();

                    $.each(subcat, function (i, itemData) {
                        $("#SubCatID").append('<option value="' + itemData.SubCat_ID + '">' +
                             itemData.SubCat_Name + '</option>');
                    });
                    //for (var i = 0; i < subcat.length; i++) {
                    //    $("#SubCatID").append('<option value="' + subcat[i] + '"></option>');
                    //}
                    $("#SubCatID").prop("disabled", false);
                };
                options.error = function () { alert("Error retrieving subcat!"); };
                $.ajax(options);
            }
            else {
                $("#SubCatID").empty();
                $("#SubCatID").prop("disabled", true);
            }
        });
    });