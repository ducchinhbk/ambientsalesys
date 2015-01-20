<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right" <?php echo $hide; ?>><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-customer').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1>Bookings</h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i>Booking lists</h3>
      </div>
      <div class="panel-body">
        
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-customer">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left">Clients</td>
                  <td class="text-left">Quickbook no</td>
                  <td class="text-left">Startdate</td>
                  <td class="text-left">End date</td>
                  <td class="text-left">Book value</td>
                  <td class="text-left">Status</td>
                  <td class="text-left">Note</td>
                  <td class="text-right">Action</td>
                </tr>
              </thead>
              <tbody>
              <?php foreach( $bookings as $row ){?>
                    <tr>
                    <td class="text-center"><?php if (in_array($row['booking_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $row['booking_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $row['booking_id']; ?>" />
                    <?php } ?></td>
                      
                      <td class="text-left"><?php echo $row['client']?></td>
                      <td class="text-left"><?php echo $row['book_no']?></td>
                      <td class="text-left"><?php echo $row['startdate']?></td>
                      <td class="text-left"><?php echo $row['enddate']?></td>
                      <td class="text-left"><?php echo number_format($row['book_val']); ?></td>
                      <td class="text-left <?php echo ' '.$row['class']?>"><?php echo $row['status']?></td>
                      <td class="text-left"><?php echo $row['note']?></td>
                      <td class="text-right">
                        <a href="<?php echo $row['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary" <?php echo $hide; ?> ><i class="fa fa-pencil"></i></a>
                      </td>
                    </tr>
                <?php }?>
                
              </tbody>
            </table>
          </div>
        </form>
       
      </div>
    </div>
  </div>
 

  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script>
</div>
<?php echo $footer; ?> 
