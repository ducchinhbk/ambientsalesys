<div id="main">
		<div id="options">
			<a href="<?=base_url()?>tickets/create" class="btn" data-toggle="modal"><i class="icon-plus-sign"></i> <?=$this->lang->line('application_create_new_ticket');?></a>
		
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
		<table class="data-sorting" id="tickets" rel="<?=base_url()?>" cellspacing="0" cellpadding="0">
		<thead>
			<th class="hidden-phone" style="width:70px"><?=$this->lang->line('application_ticket_id');?></th>
			<th class="hidden-phone no_sort" style="width:5px; padding-right: 5px;"><i class="icon icon-star-empty"></i></th>
			<th><?=$this->lang->line('application_subject');?></th>
			<th><?=$this->lang->line('application_status');?></th>
			<th><?=$this->lang->line('application_client');?></th>
			<th class="hidden-phone"><?=$this->lang->line('application_owner');?></th>
		</thead>
		<?php foreach ($ticket as $value):?>

		<tr id="<?=$value->id;?>" >
			<td  class="hidden-phone" style="width:70px"><?=$value->reference;?></td>
			<?php if(isset($value->user->id)){$user_id = $value->user->id; }else{ $user_id = FALSE; }?>
			<td  class="hidden-phone" style="width:15px"><?php if($value->updated == "1" && $user_id == $this->user->id){?><i class="icon icon-star"></i><?php }else{?> <i class="icon icon-star-empty" style="opacity: 0.2;"></i><?php } ?></td>
			<td><?=$value->subject;?></td>
			<?php $lable = FALSE; if($value->status == "new"){ $lable = "label-important"; }elseif($value->status == "open"){$lable = "label-warning";}elseif($value->status == "closed"){$lable = "label-success";}elseif($value->status == "reopened"){$lable = "label-warning";} ?>
			<td><span class="label <?php echo $lable; ?>"><?=$this->lang->line('application_ticket_status_'.$value->status);?></span></td>
			<td><?php if(!isset($value->company->name)){echo '<span class="label">'.$this->lang->line('application_no_client_assigned').'</span>'; }else{ echo '<span class="label label-info">'.$value->company->name.'</span>'; }?></td>
			<td class="hidden-phone"><?php if(!isset($value->user->firstname)){echo '<span class="label">'.$this->lang->line('application_not_assigned').'</span>'; }else{ echo '<span class="label label-info">'.$value->user->firstname.' '.$value->user->lastname.'</span>'; }?></td>

		</tr>

		<?php endforeach;?>
	 	</table>
	 	<br clear="all">
		
	</div>