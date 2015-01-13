<?php   
$attributes = array('class' => '', 'id' => '_ticket');
echo form_open_multipart($form_action, $attributes); 
if(isset($ticket)){ ?>
<input id="id" type="hidden" name="id" value="<?php echo $ticket->id; ?>" />
<?php } ?>
 <div class="modal-content">  
  <div class="modal-inner"> 

<p>
        <label for="type"><?=$this->lang->line('application_type');?></label>
        <?php $options = array();
                foreach ($types as $value):  
                $options[$value->id] = $value->name;
                endforeach;
        if(isset($ticket) && isset($ticket->type->id)){$type = $ticket->type->id;}else{$type = "";}
        echo form_dropdown('type_id', $options, $type, 'style="width:100%"');?>
</p>  
<p>
        <label for="queue"><?=$this->lang->line('application_queue');?></label>
        <?php $options = array();
                foreach ($queues as $value):  
                $options[$value->id] = $value->name;
                endforeach;
        if(isset($ticket) && isset($ticket->queue->id)){$queue = $ticket->queue->id;}else{$queue = "";}
        echo form_dropdown('queue_id', $options, $queue, 'style="width:100%"');?>
</p> 
<p>
        <label for="client"><?=$this->lang->line('application_client');?></label>
        <?php $options = array();
                $options['0'] = '-';
                foreach ($clients as $value):  
                $options[$value->id] = $value->firstname.' '.$value->lastname;
                endforeach;
        if(isset($ticket) && isset($ticket->company->id)){$client = $ticket->company->id;}else{$client = "";}
        echo form_dropdown('client_id', $options, $client, 'style="width:100%"');?>
</p>   
<p>
        <label for="user"><?=$this->lang->line('application_assign_to');?></label>
        <?php $options = array();
                $options['0'] = '-';
                foreach ($users as $value):  
                $options[$value->id] = $value->firstname.' '.$value->lastname;
                endforeach;
        if(isset($ticket) && isset($ticket->user->id)){$user = $ticket->user->id;}else{$user = "";}
        echo form_dropdown('user_id', $options, $user, 'style="width:100%"');?>
</p> 
        
<p>
        <label for="subject"><?=$this->lang->line('application_subject');?> *</label>
        <input id="subject" type="text" name="subject" class="required span5" value="<?php if(isset($ticket)){echo $ticket->subject;} ?>"  />
</p>
<p>
        <label for="text"><?=$this->lang->line('application_message');?> *</label>
        <textarea id="text" name="text" rows="9" class="required span5 textarea"></textarea>
</p>
<p>
        <label for="userfile"><?=$this->lang->line('application_attachment');?></label>

      <input type="file" name="userfile" id="file">
      <div class="dummyfile">
         <div class="input-append">
              <input id="filename" type="text" class="input span4" name="file-name">
              <a id="fileselectbutton" class="btn"><?=$this->lang->line('application_select');?></a>
         </div>
    </div>

</p>

<ul class="accesslist" style="margin: 2px;">
<li> <input type="checkbox" class="cb" id="r_notify" name="notify_agent" value="yes"> <label for="r_notify"><?=$this->lang->line('application_notify_agent');?></label>  </li>
</ul>           

</div>
        <div class="modal-footer">
        <input type="submit" name="send" class="btn btn-primary" value="<?=$this->lang->line('application_save');?>"/>
        <a class="btn" data-dismiss="modal"><?=$this->lang->line('application_close');?></a>
        </div>


<?php echo form_close(); ?>