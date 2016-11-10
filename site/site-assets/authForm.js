
$(document).ready(function () {
    $('#authForm').on('submit', function (event) {
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: $(this).attr('action'),
            data: { password: $('#password').val() },
            success: function (data) {
                if (data.isAuthenticated) {
                    window.location.href = data.url;
                } else {
                    $("#errorMessage").text(data.errorMessage);
                }
            },
            error: function () {
                $("#errorMessage").text("Unknown error!");
            }
        });
    });
});