<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-customer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> Add booking</h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-customer" class="form-horizontal">
          
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="row">
                <div class="col-sm-10">
                  <div class="tab-content">
                    <div class="tab-pane active" id="tab-data">
                      <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-client">Client</label>
                        <div class="col-sm-10">
                          <input type="text" name="client" value="<?php echo $client; ?>" placeholder="Client" id="input-client" class="form-control">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-start-date">Start date</label>
                        <div class="col-sm-3">
                          <div class="input-group date">
                            <input type="text" name="startdate" value="<?php echo $startdate; ?>" placeholder="State Date" data-date-format="YYYY-MM-DD" id="input-start-date" class="form-control">
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-end-date">End Date</label>
                        <div class="col-sm-3">
                          <div class="input-group date">
                            <input type="text" name="enddate" value="<?php echo $enddate; ?>" placeholder="End Date" data-date-format="YYYY-MM-DD" id="input-end-date" class="form-control">
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-booking-value">Booking value</label>
                        <div class="col-sm-10">
                          <input type="text" name="book_val" value="<?php echo $book_val; ?>" placeholder="Nhập số.." id="input-booking-value" class="form-control">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status">Status</label>
                        <div class="col-sm-10">
                          <select name="status" id="input-status" class="form-control">
                            <option value="1" <?php echo ($status==1)? 'selected="selected"':''; ?> >In Progress</option>
                            <option value="2" <?php echo ($status==2)? 'selected="selected"':''; ?> >Complete</option>
                            <option value="3" <?php echo ($status==3)? 'selected="selected"':''; ?> >Behind Schedule</option>
                           </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-note">Notes</label>
                        <div class="col-sm-10">
                          <textarea name="note" rows="5" placeholder="Notes" id="input-note" class="form-control"><?php echo $note; ?></textarea>
                        </div>
                      </div>
                      <input type="hidden" name="user_id" value="<?php echo $user_id; ?>" id="user-id" class="form-control">
                    </div>   
                </div>      
        </form>
      </div>
    </div>
  </div>
<script type="text/javascript"><!--


$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});	
//--></script>
</div>
<?php echo $footer; ?>