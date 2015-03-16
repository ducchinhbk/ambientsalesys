<div class="container-fluid">
        <div class="row">
          <div class="col-lg-3 col-md-3 col-sm-6">
            <div class="tile">
              <div class="tile-heading">Total Target </div>
              <div class="tile-body"><i class="fa fa-shopping-cart"></i>
                <h2 class="pull-right"><?php echo number_format($total_target); ?></h2>
              </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="tile">
                  <div class="tile-heading">Total Delivery <span class="pull-right"><?php  echo $total_percent; ?>% </span></div>
                  <div class="tile-body"><i class="fa fa-credit-card"></i>
                    <h2 class="pull-right"><?php echo number_format($total_delivery); ?></h2>
                  </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="tile">
                  <div class="tile-heading">Today percentage <span class="pull-right"></span></div>
                  <div class="tile-body"><i class="fa fa-eye"></i>
                    <h2 class="pull-right"><?php echo $total_now_percent; ?>%</h2>
                  </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6">
            <div class="tile">
              <div class="tile-heading">Total Members </div>
              <div class="tile-body"><i class="fa fa-user"></i>
                <h2 class="pull-right"><?php echo $total_member; ?></h2>
              </div>
            </div>
         </div>
    </div>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sx-12 col-sm-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <div class="pull-right"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-calendar"></i> <i class="caret"></i></a>
              <ul id="range" class="dropdown-menu dropdown-menu-right">
                <li><a href="day">Today</a></li>
                <li><a href="week">Week</a></li>
                <li class="active"><a href="month">Month</a></li>
                <li><a href="year">Year</a></li>
              </ul>
            </div>
            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Sales Analytics</h3>
          </div>
          <div class="panel-body">
            <div id="chart-sale" style="width: 100%; height: 260px;"></div>
          </div>
        </div>
        <script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.js"></script> 
        <script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.resize.min.js"></script>
        <script type="text/javascript"><!--
        $('#range a').on('click', function(e) {
        	e.preventDefault();
        	
        	$(this).parent().parent().find('li').removeClass('active');
        	
        	$(this).parent().addClass('active');
        	
        	$.ajax({
        		type: 'get',
        		url: 'index.php?route=dashboard/chart/chart&token=a7f5eac33d9a72051d987a1f22bdb1ee&range=' + $(this).attr('href'),
        		dataType: 'json',
        		success: function(json) {
                                if (typeof json['order'] == 'undefined') { return false; }
        			var option = {	
        				shadowSize: 0,
        				colors: ['#9FD5F1', '#1065D2'],
        				bars: { 
        					show: true,
        					fill: true,
        					lineWidth: 1
        				},
        				grid: {
        					backgroundColor: '#FFFFFF',
        					hoverable: true
        				},
        				points: {
        					show: false
        				},
        				xaxis: {
        					show: true,
                    		ticks: json['xaxis']
        				}
        			}
        			
        			$.plot('#chart-sale', [json['order'], json['customer']], option);	
        					
        			$('#chart-sale').bind('plothover', function(event, pos, item) {
        				$('.tooltip').remove();
        			  
        				if (item) {
        					$('<div id="tooltip" class="tooltip top in"><div class="tooltip-arrow"></div><div class="tooltip-inner">' + item.datapoint[1].toFixed(2) + '</div></div>').prependTo('body');
        					
        					$('#tooltip').css({
        						position: 'absolute',
        						left: item.pageX - ($('#tooltip').outerWidth() / 2),
        						top: item.pageY - $('#tooltip').outerHeight(),
        						pointer: 'cusror'
        					}).fadeIn('slow');	
        					
        					$('#chart-sale').css('cursor', 'pointer');		
        			  	} else {
        					$('#chart-sale').css('cursor', 'auto');
        				}
        			});
        		},
                error: function(xhr, ajaxOptions, thrownError) {
                   //alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
        	});
        });
        
        $('#range .active a').trigger('click');
        //--></script> 
    </div>
  </div>
  <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12">
          <form action="<?php echo $viewlargestbooking; ?>" method="post" id="viewlargestbook">
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-start-date" style="margin: 10px -118px 12px 23px;">Start date</label>
                  <div class="col-sm-2">
                      <div class="input-group date">
                          <input type="text" name="startdate" value="" placeholder="State Date" data-date-format="YYYY-MM-DD" id="input-start-date" class="form-control">
                          <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span>
                       </div>
                   </div>
                   <label class="col-sm-2 control-label" for="input-end-date" style="margin: 10px -118px 12px 23px;">End Date</label>
                   <div class="col-sm-2">
                       <div class="input-group date">
                            <input type="text" name="enddate" value="" placeholder="End Date" data-date-format="YYYY-MM-DD" id="input-end-date" class="form-control">
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span>
                       </div>
                   </div>
                   <div class="col-sm-2">
                        <button type="submit" form="form-customer" data-toggle="tooltip" title="View Largest booking" class="btn btn-primary" onclick="viewlargestbook()"><i class="fa fa-search"></i>View Largest booking</button>
                   </div>
                   
              </div>
           </form>
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12"> 
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> Team members</h3>
            
          </div>
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center">
                  <input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"></td>
                  <td class="text-center">Image</td>
                  <td class="text-center">Fullname</td>
                  <td class="text-center">Group</td>
                  <td class="text-center">Telephone</td>
                  <td class="text-center">Target</td>
                  <td class="text-center">Delivery</td>
                  <td class="text-center">Delivery/Target</td>
                  <td class="text-center">Today Percentage</td>
                  <td class="text-right">Action</td>
                </tr>
              </thead>
              <tbody>
                <?php foreach( $users as $row ){?>
                    <tr>
                    <td class="text-center"><?php if (in_array($row['user_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $row['user_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $row['user_id']; ?>" />
                    <?php } ?></td>
                      
                      <td class="text-center"><img src="<?php echo $row['image']?>" alt="avatar"/></td>
                      <td class="text-center"><?php echo $row['fullname']?></td>
                      <td class="text-center"><?php echo $row['groupname']?></td>
                      <td class="text-center"><?php echo $row['email']?></td>
                      <td class="text-center text-danger"><?php echo number_format($row['target']); ?></td>
                      <td class="text-center text-success"><?php echo number_format($row['delivery']); ?></td>
                      <td class="text-center"><?php echo $row['percent']?>%</td>
                      <td class="text-center"><?php echo $row['now_percent']?>%</td>
                      <td class="text-right">
                        <a href="<?php echo $row['view']; ?>" data-toggle="tooltip" title="View" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
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

<script type="text/javascript"><!--
   function viewlargestbook()
   {
        $('#viewlargestbook').submit();
    
   }
  
//--></script>
