

$(document).ready(function () {
    $('.mainForm').hide()
    $('#seminarMod').show();


    $('#biostatList2').on('change', function () {
        var biostatSelect = $('#biostatList2').val();

        switch (biostatSelect)
        {
            case "fangr":
                $('input:checkbox:not("#Rui")').attr('checked', false);
                $('#Rui').attr('checked', true);
                break;
            case "hjahn":
                $('input:checkbox:not("#Jun")').attr('checked', false);
                $('#Jun').attr('checked', true);
                break;
            case "jamesdav":
                $('input:checkbox:not("#Jim")').attr('checked', false);
                $('#Jim').attr('checked', true);
                break;
            case "jjchen":
                $('input:checkbox:not("#John")').attr('checked', false);
                $('#John').attr('checked', true);
                break;
            case "jllr":
                $('input:checkbox:not("#Jewels")').attr('checked', false);
                $('#Jewels').attr('checked', true);
                break;
            case "kgandhi":
                $('input:checkbox:not("#Krupa")').attr('checked', false);
                $('#Krupa').attr('checked', true);
                break;
            case "lime":
                $('input:checkbox:not("#Eunjung")').attr('checked', false);
                $('#Eunjung').attr('checked', true);
                break;
            case "rdcastro":
                $('input:checkbox:not("#Rosa")').attr('checked', false);
                $('#Rosa').attr('checked', true);
                break;
            case "vedbar":
                $('input:checkbox:not("#Ved")').attr('checked', false);
                $('#Ved').attr('checked', true);
                break;
            case "yrui":
                $('input:checkbox:not("#Yang")').attr('checked', false);
                $('#Yang').attr('checked', true);
                break;
            case "pwnhwang":
                $('input:checkbox:not("#Phoebe")').attr('checked', false);
                $('#Phoebe').attr('checked', true);
                break;
            case "jdelosr":
                $('input:checkbox:not("#Jason")').attr('checked', false);
                $('#Jason').attr('checked', true);
                break;
            case "cksiri":
                $('input:checkbox:not("#Chathura")').attr('checked', false);
                $('#Chathura').attr('checked', true);
                break;
            case "soyung":
                $('input:checkbox:not("#Soyung")').attr('checked', false);
                $('#Soyung').attr('checked', true);
                break;
            case "dengy":
                $('input:checkbox:not("#Youping")').attr('checked', false);
                $('#Youping').attr('checked', true);
                break;
            default:
                $('input:checkbox:not("#Rui")').attr('checked', false);
                $('#Rui').attr('checked', true)
                break;
        }


    });

    //Reveal and hide forms based on its academic type
    $('#academicTypeList2').on('change', function() {
    
        var academicSelect = $('#academicTypeList2').val();

        //alert("hello!  Your selected index for academic type list 2 is: \n \n" + academicSelect + "\n \n !!!");

        switch (academicSelect) {
            case "1":
                $('.mainForm').fadeOut(500);
                $('#seminarMod').fadeIn(500);
                break;
            case "2":
                $('.mainForm').fadeOut(500);
                $('#teachingMod').fadeIn(500);
                break;
            case "3":
                $('.mainForm').fadeOut(500);
                $('#dissertationMod').fadeIn(500);
                break;
            case "4":
                $('.mainForm').fadeOut(500);
                $('#panelMod').fadeIn(500);
                break;
            case "5":
                $('.mainForm').fadeOut(500);
                $('#journalMod').fadeIn(500);
                break;
            case "6":
                $('.mainForm').fadeOut(500);
                $('#grantMod').fadeIn(500);
                break;
            case "7":
                $('.mainForm').fadeOut(500);
                $('#honorMod').fadeIn(500);
                break;
            case "8":
                $('.mainForm').fadeOut(500);
                $('#professionalMod').fadeIn(500);
                break;
            case "9":
                $('.mainForm').fadeOut(500);
                $('#mentorMod').fadeIn(500);
                break;
            case "10":
                $('.mainForm').fadeOut(500);
                $('#dataMod').fadeIn(500);
                break;
            case "11":
                $('.mainForm').fadeOut(500);
                $('#otherMod').fadeIn(500);
                break;
            default:
                $('.mainForm').hide();
                $('#seminarMod').show();
                break;
        }

    });


    //Removes all forms that are hidden from validation
    $("#Submit").click(function () {
        $('.mainForm:hidden').remove();
        $('#form1').submit();
        //Prints message that task has been completed.
        alert("Your event has been saved!");
    });



});





