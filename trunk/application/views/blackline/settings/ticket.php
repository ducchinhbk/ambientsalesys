	<div id="main">
		<div id="options">
			<div class="btn-group margintop5 nav-tabs normal-white-space" data-toggle="buttons-radio">
				<?php foreach ($submenu as $name=>$value):?>
	                <a class="btn btn-mini" id="<?php $val_id = explode("/", $value); if(!is_numeric(end($val_id))){echo end($val_id);}else{$num = count($val_id)-2; echo $val_id[$num];} ?>" href="<?=site_url($value);?>"><?=$name?></a>
	            <?php endforeach;?>
	            
			</div>
			<script type="text/javascript">$(document).ready(function() { 
	            	$('.nav-tabs #<?php $last_uri = end(explode("/", uri_string())); if($val_id[count($val_id)-2] != "settings"){echo end($val_id);}else{ echo $last_uri;} ?>').button('toggle'); });
	        </script> 

		</div>
		<hr/>
		<div class="table_head"><h6><?=$this->lang->line('application_email');?> <?=$this->lang->line('application_settings');?></h6></div>
		<?php   
		$attributes = array('class' => '', 'id' => 'ticket');
		echo form_open_multipart($form_action, $attributes); 
		?>
		<table id="settings" cellspacing="0" cellpadding="0">
		<thead>
			<th><?=$this->lang->line('application_option');?></th>
			<th><?=$this->lang->line('application_value');?></th>
		</thead>

		<tr>
		<td><?=$this->lang->line('application_postmaster_active');?> <a class="cursor po pull-right" rel="popover" data-content="<?=$this->lang->line('application_postmaster_help');?>" data-original-title="<?=$this->lang->line('application_ticket');?>"><i class="fam-information"></i></td>
		<td> <div class="switch switch-mini" data-on-label="<i class='icon-ok icon-white'></i>" data-off-label="<i class='icon-remove'></i>">
            <input name="ticket_config_active" type="checkbox" value="1" <?php if($settings->ticket_config_active == "1"){ ?> checked="checked" <?php } ?>>
        </div>
		</td>
		</tr>
		<tr>
		<td><?=$this->lang->line('application_imap_or_pop');?></td>
		<td> <div class="switch switch-mini" data-on-label="<?=$this->lang->line('application_imap');?>" data-off-label="<?=$this->lang->line('application_pop');?>">
            <input name="ticket_config_imap" type="checkbox" value="1" <?php if($settings->ticket_config_imap == "1"){ ?> checked="checked" <?php } ?>>
        </div>
		</td>
		</tr>
		
		<tr>
		<td><?=$this->lang->line('application_ssl');?></td>
		<td> <div class="switch switch-mini" data-on-label="<i class='icon-ok icon-white'></i>" data-off-label="<i class='icon-remove'></i>">
            <input name="ticket_config_ssl" type="checkbox" value="1" <?php if($settings->ticket_config_ssl == "1"){ ?> checked="checked" <?php } ?>>
        </div>
		</td>
		</tr>

		<tr>
		<td><?=$this->lang->line('application_delete_from_mailbox');?> <a class="cursor po pull-right" rel="popover" data-content="<?=$this->lang->line('application_delete_from_mailbox_help');?>" data-original-title="<?=$this->lang->line('application_delete');?>"><i class="fam-information"></i></td>
		<td> <div class="switch switch-mini" data-on-label="<i class='icon-ok icon-white'></i>" data-off-label="<i class='icon-remove'></i>">
            <input name="ticket_config_delete" type="checkbox" value="1" <?php if($settings->ticket_config_delete == "1"){ ?> checked="checked" <?php } ?>>
        </div>
		</td>
		</tr>

		<tr>
			<td><?=$this->lang->line('application_email');?></td>
			<td><input type="text" name="ticket_config_email" value="<?=$settings->ticket_config_email;?>"></td>
		</tr>

		<tr>
			<td><?=$this->lang->line('application_host');?></td>
			<td><input type="text" name="ticket_config_host" value="<?=$settings->ticket_config_host;?>"></td>
		</tr>

		<tr>
			<td><?=$this->lang->line('application_username');?></td>
			<td><input type="text" name="ticket_config_login" value="<?=$settings->ticket_config_login;?>"></td>
		</tr>

		<tr>
			<td><?=$this->lang->line('application_password');?></td>
			<td><input type="password" name="ticket_config_pass" value="<?=$settings->ticket_config_pass;?>"></td>
		</tr>
		<tr>
			<td><?=$this->lang->line('application_port');?> (143 or 110)</td>
			<td><input type="text" name="ticket_config_port" value="<?=$settings->ticket_config_port;?>"></td>
		</tr>
		<tr>
			<td><?=$this->lang->line('application_mailbox');?></td>
			<td><input type="text" name="ticket_config_mailbox" value="<?=$settings->ticket_config_mailbox;?>"></td>
		</tr>
		<tr>
			<td><?=$this->lang->line('application_additional_flags');?></td>
			<td><input type="text" name="ticket_config_flags" value="<?=$settings->ticket_config_flags;?>"></td>
		</tr>
		<tr>
			<td><?=$this->lang->line('application_imap_search');?> <a class="cursor po pull-right" rel="popover" data-content="<?=$this->lang->line('application_imap_search_help');?>" data-original-title="<?=$this->lang->line('application_imap_search');?>"><i class="fam-information"></i></td>
			<td><input type="text" name="ticket_config_search" value="<?=$settings->ticket_config_search;?>"></td>
		</tr>
		
		<tr>
			<td><?=$this->lang->line('application_postmaster_address');?>  <a class="cursor po pull-right" rel="popover" data-content="<?=$this->lang->line('application_postmaster_help');?>" data-original-title="<?=$this->lang->line('application_postmaster_address');?>"><i class="fam-information"></i></td>
			<td>wget <?=base_url()?>postmaster -O /dev/null</td>
		</tr>
		<tr>
			<td><?=$this->lang->line('application_last_postmaster_run');?></td>
			<td><?php if(!empty($settings->ticket_config_timestamp)){echo date("Y-m-d H:i", $settings->ticket_config_timestamp); }else {echo "-";}?></td>
		</tr>
		<tr>
			<td class="bottom" colspan="2">
			 <input type="submit" name="send" class="btn btn-primary" value="<?=$this->lang->line('application_save');?>"/>
			 <a href="<?=base_url()?>settings/testpostmaster" class="btn" data-toggle="modal"><?=$this->lang->line('application_postmaster_test');?></a>
			</td>
		</tr>
	 	</table>
	 	 

		<br><br>

		<div class="table_head"><h6><?=$this->lang->line('application_ticket');?> <?=$this->lang->line('application_settings');?></h6></div>
		
		<table id="ticketsettings" cellspacing="0" cellpadding="0">
		<thead>
			<th><?=$this->lang->line('application_option');?></th>
			<th><?=$this->lang->line('application_value');?></th>
		</thead>

		<tr>
		<td>
        <?=$this->lang->line('application_ticket_default_status');?></td>
        <td>
        <?php $options = array(); 
                $options['new'] = $this->lang->line('application_ticket_status_new');
                $options['open'] = $this->lang->line('application_ticket_status_open');
                $options['inprogress'] = $this->lang->line('application_ticket_status_inprogress');
                $options['reopened'] = $this->lang->line('application_ticket_status_reopened');
                $options['onhold'] = $this->lang->line('application_ticket_status_onhold');
                $options['closed'] = $this->lang->line('application_ticket_status_closed');

        if(isset($settings->ticket_default_status)){$status = $settings->ticket_default_status;}else{$status = "";}
        echo form_dropdown('ticket_default_status', $options, $status, 'style="width:100%"');?>
		</td> 
		</tr>

		<tr>
			<td>
        <?=$this->lang->line('application_ticket_default_type');?></td>
        <td>
        <?php $options = array();
                foreach ($types as $value):  
                $options[$value->id] = $value->name;
                endforeach;
        if(isset($settings->ticket_default_type)){$type = $settings->ticket_default_type;}else{$type = "";}
        echo form_dropdown('ticket_default_type', $options, $type, 'style="width:100%"');?>
		</td> 
		</tr> 

		<tr>
		<td>
        <?=$this->lang->line('application_ticket_default_owner');?></td>
        <td>
        <?php $options = array(); 
               foreach ($owners as $value):  
                $options[$value->id] = $value->firstname.' '.$value->lastname;
                endforeach;

        if(isset($settings->ticket_default_owner)){$owner = $settings->ticket_default_owner;}else{$owner = "";}
        echo form_dropdown('ticket_default_owner', $options, $owner, 'style="width:100%"');?>
		</td> 
		</tr>

		<tr>
		<td>
        <?=$this->lang->line('application_ticket_default_queue');?></td>
        <td>
        <?php $options = array(); 
               foreach ($queues as $value):  
                $options[$value->id] = $value->name;
                endforeach;

        if(isset($settings->ticket_default_queue)){$queue = $settings->ticket_default_queue;}else{$queue = "";}
        echo form_dropdown('ticket_default_queue', $options, $queue, 'style="width:100%"');?>
		</td> 
		</tr>

		<tr>
			<td class="bottom" colspan="2">
			 <input type="submit" name="send" class="btn btn-primary" value="<?=$this->lang->line('application_save');?>"/>
		</td>
		</tr>
	 	</table>
	 	 
		<?php echo form_close(); ?>

<br><br>
<div class="row">
	<div class="span6 nosearch">
	<div class="table_head"><h6><i class="icon-tag"></i><?=$this->lang->line('application_types');?></h6><a href="<?=base_url()?>settings/ticket_type" class="btn btn-mini pull-right" data-toggle="modal"><i class="icon-plus"></i> <?=$this->lang->line('application_add_type');?></a></div>
			<table class="" id="types" cellspacing="0" cellpadding="0">
			<thead>
				<th><?=$this->lang->line('application_name');?></th>
				<th><?=$this->lang->line('application_description');?></th>
				<th><?=$this->lang->line('application_action');?></th>
			</thead>
			<?php foreach ($types as $value):?>

			<tr id="t<?=$value->id;?>" >
				<td><?=$value->name;?></td>
				<td><?=$value->description;?></td>
				<td class="option btn-group">
					<a class="btn btn-mini po" rel="popover" data-placement="left" data-content="<a class='btn btn-danger po-delete ajax-silent' href='<?=base_url()?>settings/ticket_type/<?=$value->id;?>/delete'><?=$this->lang->line('application_yes_im_sure');?></a> <button class='btn po-close'><?=$this->lang->line('application_no');?></button> <input type='hidden' name='td-id' class='id' value='t<?=$value->id;?>'>" data-original-title="<b><?=$this->lang->line('application_really_delete');?></b>"><i class="icon-trash"></i></a>
					<a href="<?=base_url()?>settings/ticket_type/<?=$value->id;?>" class="btn btn-mini" data-toggle="modal"><i class="icon-edit"></i></a>
				</td>
			</tr>

			<?php endforeach;?>
		 	</table>
	</div>

	<div class="span6 nosearch">
	<div class="table_head"><h6><i class="icon-tag"></i><?=$this->lang->line('application_queues');?></h6><a href="<?=base_url()?>settings/ticket_queue" class="btn btn-mini pull-right" data-toggle="modal"><i class="icon-plus"></i> <?=$this->lang->line('application_add_queue');?></a></div>
			<table class="data" id="queues" cellspacing="0" cellpadding="0">
			<thead>
				<th><?=$this->lang->line('application_name');?></th>
				<th><?=$this->lang->line('application_description');?></th>
				<th><?=$this->lang->line('application_action');?></th>
			</thead>
			<?php foreach ($queues as $value):?>

			<tr id="q<?=$value->id;?>" >
				<td><?=$value->name;?></td>
				<td><?=$value->description;?></td>
				<td class="option btn-group">
					<a class="btn btn-mini po" rel="popover" data-placement="left" data-content="<a class='btn btn-danger po-delete ajax-silent' href='<?=base_url()?>settings/ticket_queue/<?=$value->id;?>/delete'><?=$this->lang->line('application_yes_im_sure');?></a> <button class='btn po-close'><?=$this->lang->line('application_no');?></button> <input type='hidden' name='td-id' class='id' value='q<?=$value->id;?>'>" data-original-title="<b><?=$this->lang->line('application_really_delete');?></b>"><i class="icon-trash"></i></a>
					<a href="<?=base_url()?>settings/ticket_queue/<?=$value->id;?>" class="btn btn-mini" data-toggle="modal"><i class="icon-edit"></i></a>
				</td>
			</tr>

			<?php endforeach;?>
		 	</table>
	</div>

</div>
	 	<br clear="all">



	

	</div>