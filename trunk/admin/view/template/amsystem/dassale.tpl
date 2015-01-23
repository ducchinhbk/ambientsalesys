<div class="container-fluid">
        <div class="row">
          <div class="col-lg-3 col-md-3 col-sm-6">
            <div class="tile">
              <div class="tile-heading">Total Target </div>
              <div class="tile-body"><i class="fa fa-shopping-cart"></i>
                <h2 class="pull-right"><?php echo number_format($target); ?></h2>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="tile">
                  <div class="tile-heading">Total Delivery <span class="pull-right"><?php echo $percent; ?>% </span></div>
                  <div class="tile-body"><i class="fa fa-credit-card"></i>
                    <h2 class="pull-right"><?php echo number_format($delivery); ?></h2>
                  </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="tile">
                  <div class="tile-heading">Today percentage <span class="pull-right"></span></div>
                  <div class="tile-body"><i class="fa fa-eye"></i>
                    <h2 class="pull-right"><?php echo $now_percent; ?>%</h2>
                  </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6">
            <div class="tile">
              <div class="tile-heading">Active campaigns </div>
              <div class="tile-body"><i class="fa fa-user"></i>
                <h2 class="pull-right"><?php echo $activeCampaign; ?></h2>
              </div>
            </div>
         </div>
    </div>
    
  <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12"> 
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> Payments history</h3>
          </div>
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center">
                  <input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"></td>
                  <td class="text-center">Agency</td>
                  <td class="text-center">Client</td>
                  <td class="text-center">Quick book no.</td>
                  <td class="text-center">Start date</td>
                  <td class="text-center">End date</td>
                  <td class="text-center">Booking value</td>
                  <td class="text-center">Status</td>
                  <td class="text-center">Note</td>
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
                      <td class="text-left"><?php echo $row['agency']?></td>
                      <td class="text-left"><?php echo $row['client']?></td>
                      <td class="text-left"><?php echo $row['book_no']?></td>
                      <td class="text-left"><?php echo $row['startdate']?></td>
                      <td class="text-left"><?php echo $row['enddate']?></td>
                      <td class="text-left"><?php echo number_format($row['book_val']); ?></td>
                      <td class="text-left <?php echo ' '.$row['class']?>"><?php echo $row['status']?></td>
                      <td class="text-left"><?php echo $row['note']?></td>
                      <td class="text-right">
                        <a href="<?php echo $row['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                      </td>
                    </tr>
                <?php }?>
                 
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>