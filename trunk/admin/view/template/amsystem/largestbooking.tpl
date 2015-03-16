<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      
      <h1>Largest Bookings</h1>
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
                  <td class="text-left">User name </td>
                  <td class="text-left">Agency</td>
                  <td class="text-left">Client</td>
                  <td class="text-left">Quickbook no</td>
                  <td class="text-left">Startdate</td>
                  <td class="text-left">End date</td>
                  <td class="text-left">Book value</td>
                  <td class="text-left">Status</td>
                </tr>
              </thead>
              <tbody>
              <?php foreach( $bookings as $row ){?>
                    <tr>
                      <td class="text-left"><?php echo $row['user_name']?></td>
                      <td class="text-left"><?php echo $row['agency']?></td>
                      <td class="text-left"><?php echo $row['client']?></td>
                      <td class="text-left"><?php echo $row['quickbook']?></td>
                      <td class="text-left"><?php echo $row['startdate']?></td>
                      <td class="text-left"><?php echo $row['enddate']?></td>
                      <td class="text-left"><?php echo number_format($row['book_val']); ?></td>
                      <td class="text-left <?php echo ' '.$row['class']?>"><?php echo $row['status']?></td>
                      <!--td class="text-right">
                        <a href="<?php echo $row['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary" <?php echo $hide; ?> ><i class="fa fa-pencil"></i></a>
                      </td-->
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
