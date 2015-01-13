<script>$(document).ready(function(){ 
	$("form").validate({

     errorPlacement: function(error, element)
     {
        error.insertAfter(element).hide().slideToggle(500);
     },
     success: function(label)
     {
     	$(label).remove();

     },
	 sendHandler: function(form) {
	   form.submit();
	 	} 
	 	
	});

	
});
$.ajaxSetup ({
    // Disable caching of AJAX responses
    cache: false
});
	//$('.textarea').wysihtml5();

	//$('.datepicker').datepicker({format: 'yyyy-mm-dd'});
</script>
<div class="modal-header">
    <a class="close" data-dismiss="modal">×</a>
    <h3><?=$title;?></h3>
</div>
<div class="modal-body">
    <?=$yield?>
</div>

