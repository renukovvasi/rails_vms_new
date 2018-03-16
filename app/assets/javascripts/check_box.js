<script>
    $(document).ready(function() {
          $("#check_all").change(function() {
            if (this.checked) {
              $(".user_check").each(function() {
                this.checked=true;
              });
            } else {
              $(".user_check").each(function() {
                this.checked=false;
              });
            }
          });

          $(".user_check").click(function () {
            if ($(this).is(":checked")) {
              var isAllChecked = 0;

              $(".user_check").each(function() {
                if (!this.checked)
                    isAllChecked = 1;
              });

              if (isAllChecked == 0) {
                $("#check_all").prop("checked", true);
              }     
            } else {
              $("#check_all").prop("checked", false);
              }
              
              links=document.getElementsById("hours_chk") ;
              links.style.color = 'white';
            });
      });
</script>