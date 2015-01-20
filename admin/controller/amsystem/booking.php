<?php
class ControllerAmsystemBooking extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('sale/customer');

		$this->document->setTitle('Booking');

		$this->load->model('amsystem/booking');
        
        
		$this->getList();
	}

	public function add() {
		$this->load->language('sale/customer');

		$this->document->setTitle('Booking');

		$this->load->model('amsystem/booking');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_amsystem_booking->addbooking($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');


			$this->response->redirect($this->url->link('amsystem/booking', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('amsystem/booking');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
		  
			$this->model_amsystem_booking->editBooking($this->request->get['booking_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			$this->response->redirect($this->url->link('amsystem/booking', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('amsystem/booking');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $booking_id) {
				$this->model_amsystem_booking->deleteBooking($booking_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

		
			$this->response->redirect($this->url->link('amsystem/booking', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

		
	protected function getList() {
	
		$url = '';
        if (isset($this->request->get['user_id'])) {
			$data['user_id'] = $this->request->get['user_id'];
            $data['hide'] = 'style="display: none;"';
		} else {
			$data['user_id'] = $this->session->data['user_id'];
            $data['hide'] = '';
		}
        
        
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Bookings',
			'href' => $this->url->link('amsystem/booking', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('amsystem/booking/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('amsystem/booking/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
        
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');


		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_login'] = $this->language->get('button_login');
		$data['button_unlock'] = $this->language->get('button_unlock');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';
        $data['bookings'] = array();
        
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
				'client'         => $result['client'],
                'book_no'        => '00'.$data['user_id'].'-'.$result['booking_id'],
				'startdate'      => date('d-m-Y', strtotime($result['startdate'])),
                'enddate'        => date('d-m-Y', strtotime($result['enddate'])),
                'book_val'       => $result['book_val'],
                'status'         => $status,
                'note'           => $result['note'],
                'class'          => $class,
				'date_added'     => date('d-m-Y', strtotime($result['date_added'])),
				'edit'           => $this->url->link('amsystem/booking/edit', 'token=' . $this->session->data['token'] . '&booking_id=' . $result['booking_id'] . $url, 'SSL')
			);
		}
        
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('amsystem/booking_list.tpl', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['booking_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');		
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_upload'] = $this->language->get('button_upload');

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['booking_id'])) {
			$data['booking_id'] = $this->request->get['booking_id'];
		} else {
			$data['booking_id'] = 0;
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		

		$url = '';

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Bookings',
			'href' => $this->url->link('amsystem/booking', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['booking_id'])) {
			$data['action'] = $this->url->link('amsystem/booking/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('amsystem/booking/edit', 'token=' . $this->session->data['token'] . '&booking_id=' . $this->request->get['booking_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('amsystem/booking', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['booking_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$booking_info = $this->model_amsystem_booking->getBooking($this->request->get['booking_id']);
		}

		if (isset($this->request->post['client'])) {
			$data['client'] = $this->request->post['client'];
		} elseif (!empty($booking_info)) {
			$data['client'] = $booking_info['client'];
		} else {
			$data['client'] = '';
		}

		if (isset($this->request->post['startdate'])) {
			$data['startdate'] = $this->request->post['startdate'];
		} elseif (!empty($booking_info)) {
			$data['startdate'] = $booking_info['startdate'];
		} else {
			$data['startdate'] = '';
		}

		if (isset($this->request->post['enddate'])) {
			$data['enddate'] = $this->request->post['enddate'];
		} elseif (!empty($booking_info)) {
			$data['enddate'] = $booking_info['enddate'];
		} else {
			$data['enddate'] = '';
		}

		if (isset($this->request->post['book_val'])) {
			$data['book_val'] = $this->request->post['book_val'];
		} elseif (!empty($booking_info)) {
			$data['book_val'] = $booking_info['book_val'];
		} else {
			$data['book_val'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($booking_info)) {
			$data['status'] = $booking_info['status'];
		} else {
			$data['status'] = '';
		}
        
        if (isset($this->request->post['note'])) {
			$data['note'] = $this->request->post['note'];
		} elseif (!empty($booking_info)) {
			$data['note'] = $booking_info['note'];
		} else {
			$data['note'] = '';
		}
        
        $data['user_id'] = $this->session->data['user_id'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('amsystem/booking_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'amsystem/booking')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}


		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'sale/customer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}





}