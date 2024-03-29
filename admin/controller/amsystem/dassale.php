<?php
class ControllerAmsystemDassale extends Controller {
	public function index() {
		$this->load->language('amsystem/dasadmin');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');
        $data['button_edit'] = $this->language->get('button_edit');
		

		
        if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}
        $url = '';
		$data['user_id'] = $this->session->data['user_id'];

		$data['token'] = $this->session->data['token'];
        
        $current_year = date("Y");
        $from_date = date("Y").'-01-01';
        $to_date = date('Y-m-d');
        
        $now = new DateTime($from_date);
        $ref = new DateTime($to_date);
        $diff = $now->diff($ref);
        $sumdate =  $diff->d + 1; 
        
        //get target
        $this->load->model('amsystem/user');
        $target = $this->model_amsystem_user->getTarget($data['user_id']);
        $data['target'] = $target;
        $data['delivery'] = 0;
        $data['activeCampaign'] = 0;
        $data['bookings'] = array();
        $this->load->model('amsystem/booking');
        
        $booking_total = $this->model_amsystem_booking->getTotalBookings($data['user_id']);

		$results = $this->model_amsystem_booking->getBookings($data['user_id']);
 	    foreach ($results as $result) {
 	        
            if( $result['status']== 1)
            {
                $status = 'In Progress';
                $class = 'text-primary'; 
            } 
            else if($result['status']== 2)
            {
                $status = 'Complete';
                $class = 'text-success';
            }
                
            else if($result['status']== 3)
            {
                $status = 'Behind Schedule';
                $class = 'text-danger';
            }
            else;
            
            if($result['note']== 0)
                $result['note'] = '';
                
			$data['bookings'][]  = array(
				'booking_id'     => $result['booking_id'],
                'agency'         => $result['agency'],
				'client'         => $result['client'],
                'book_no'        => $result['quickbook'],
				'startdate'      => date('d-m-Y', strtotime($result['startdate'])),
                'enddate'        => date('d-m-Y', strtotime($result['enddate'])),
                'book_val'       => $result['book_val'],
                'status'         => $status,
                'note'           => $result['note'],
                'class'          => $class,
				'date_added'     => date('d-m-Y', strtotime($result['date_added'])),
				'edit'           => $this->url->link('amsystem/booking/edit', 'token=' . $this->session->data['token'] . '&booking_id=' . $result['booking_id'] . $url, 'SSL')
			);
            
            $data['delivery'] = $data['delivery'] + $result['book_val'];
            if(time() < strtotime($result['enddate']))
            {
                $data['activeCampaign'] = $data['activeCampaign'] + 1;
            }
		}
        $data['percent'] = round($data['delivery']/$data['target']*100, 2);
        $data['now_percent'] = round(($target/365*$sumdate)/$target*100, 2);
       
		return $this->load->view('amsystem/dassale.tpl', $data);
	}
}
