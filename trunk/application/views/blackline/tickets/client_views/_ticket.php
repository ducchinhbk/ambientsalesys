<?php   
$attributes = array('class' => '', 'id' => '_ticket');
echo form_open_multipart($form_action, $attributes); 
?>
 <div class="modal-content">  
  <div class="modal-inner">         
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

</div>
        <div class="modal-footer">
        <input type="submit" name="send" class="btn btn-primary" value="<?=$this->lang->line('application_save');?>"/>
        <a class="btn" data-dismiss="modal"><?=$this->lang->line('application_close');?></a>
        </div>


<?php echo form_close(); ?>