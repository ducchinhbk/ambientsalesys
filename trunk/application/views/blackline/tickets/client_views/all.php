<div id="main">
		<div id="options">
			<a href="<?=base_url()?>ctickets/create" class="btn" data-toggle="modal"><i class="icon-plus-sign"></i> <?=$this->lang->line('application_create_new_ticket');?></a>
		
			<div class="btn-group margintop5 pull-right nav-tabs" data-toggle="buttons-radio">
				<?php foreach ($submenu as $name=>$value):?>
	                <a class="btn btn-mini" id="<?php $val_id = explode("/", $value); if(!is_numeric(end($val_id))){echo end($val_id);}else{$num = count($val_id)-2; echo $val_id[$num];} ?>" href="<?=site_url($value);?>"><?=$name?></a>
	            <?php endforeach;?>
	            
			</div>
			<script type="text/javascript">$(document).ready(function() { 
	            	$('.nav-tabs #<?php $last_uri = end(explode("/", uri_string())); if($val_id[count($val_id)-2] != "filter"){echo end($val_id);}else{ echo $last_uri;} ?>').button('toggle'); });
	        </script> 
		</div>
		<div class="table_head"><h6><i class="icon-tag"></i><?=$this->lang->line('application_tickets');?></h6></div>
		<table class="data-sorting" id="ctickets" rel="<?=base_url()?>" cellspacing="0" cellpadding="0">
		<thead>
			<th class="hidden-phone" style="width:70px"><?=$this->lang->line('application_ticket_id');?></th>
			<th><?=$this->lang->line('application_subject');?></th>
			<th><?=$this->lang->line('application_status');?></th>
			<th class="hidden-phone"><?=$this->lang->line('application_owner');?></th>
		</thead>
		<?php foreach ($ticket as $value):?>

		<tr id="<?=$value->id;?>" >
			<td  class="hidden-phone" style="width:70px"><?=$value->reference;?></td>
			<td><?=$value->subject;?></td>
			<?php $lable = FALSE; if($value->status == "new"){ $lable = "label-warning"; $status = "open"; }elseif($value->status == "open"){$lable = "label-warning"; $status = $value->status;}elseif($value->status == "closed"){$lable = "label-success"; $status = $value->status;}elseif($value->status == "reopened"){$lable = "label-warning"; $status = $value->status;} ?>
			<td><span class="label <?php echo $lable; ?>"><?=$this->lang->line('application_ticket_status_'.$status);?></span></td>
			<td class="hidden-phone"><?php if(!isset($value->user->firstname)){echo '<span class="label">'.$this->lang->line('application_not_assigned').'</span>'; }else{ echo '<span class="label label-info">'.$value->user->firstname.' '.$value->user->lastname.'</span>'; }?></td>

		</tr>

		<?php endforeach;?>
	 	</table>
	 	<br clear="all">
		
	</div>