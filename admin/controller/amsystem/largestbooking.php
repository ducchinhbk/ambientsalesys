<?php
class ControllerAmsystemLargestbooking extends Controller {
	public function index() {
		$this->load->language('amsystem/dasadmin');

		$this->document->setTitle('Largest Booking');

		$data['heading_title'] = 'Largest Booking';
    
        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Largest Booking',
			'href' => $this->url->link('amsystem/largestbooking', 'token=' . $this->session->data['token'] , 'SSL')
		);
        
        
		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');
        $data['button_edit'] = $this->language->get('button_edit');
        
        $this->load->model('amsystem/booking');
        
        $data['bookings'] = array();
        if ($this->request->server['REQUEST_METHOD'] == 'POST') {
            
		    $startdate = $this->request->post['startdate'];
            $enddate = $this->request->post['enddate'];
		    $data['error_warning'] = '';
		}
        else
        {
            $startdate = '';
            $enddate = '';
            $data['error_warning'] = "Please choose start date and end date!";
        }

		$results = $this->model_amsystem_booking->getBookingByDateRange( $startdate, $enddate );

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
            
			$data['bookings'][]  = array(
				'booking_id'     => $result['booking_id'],
                'agency'         => $result['agency'],
				'client'         => $result['client'],
                'quickbook'        => $result['quickbook'],
				'startdate'      => date('d-m-Y', strtotime($result['startdate'])),
                'enddate'        => date('d-m-Y', strtotime($result['enddate'])),
                'book_val'       => $result['book_val'],
                'status'         => $status,
                'user_name'           => $result['user_name'],
                'class'          => $class,
				'date_added'     => date('d-m-Y', strtotime($result['date_added'])),
				//'edit'           => $this->url->link('amsystem/booking/edit', 'token=' . $this->session->data['token'] . '&booking_id=' . $result['booking_id'] . $url, 'SSL')
			);
		}
		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('amsystem/largestbooking.tpl', $data));
	}
}
