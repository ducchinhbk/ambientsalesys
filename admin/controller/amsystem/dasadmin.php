<?php
class ControllerAmsystemDasadmin extends Controller {
	public function index() {
		$this->load->language('amsystem/dasadmin');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');
        
        if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}
        
        $current_year = date("Y");
        $from_date = date("Y").'-01-01';
        $now = time(); // or your date as well
        $your_date = strtotime($from_date);
        $datediff = abs($now - $your_date);
        $sumdate = floor($datediff/(60*60*24)) +1;
        
        $this->load->model('tool/image');
        $this->load->model('amsystem/dashboard');
        $data['total_target'] = 0;
        $data['total_delivery'] = 0;
        $data['users'] = array();
        $results = $this->model_amsystem_dashboard->get_team_members();
        $data['total_member'] = count($results);
        $data['viewlargestbooking']  = $this->url->link('amsystem/largestbooking', 'token=' . $this->session->data['token'], 'SSL');
	
    
    	foreach ($results as $result) {
 	        if ($result['image'] && is_file(DIR_IMAGE . $result['image'])) {
    			$data['thumb'] = $this->model_tool_image->resize($result['image'], 50, 50);
    		} else {
    			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 50, 50);
    		}
            
                
			$data['users'][]  = array(
				'user_id'     => $result['user_id'],
				'image'         => $data['thumb'],
                'fullname'        => $result['fullname'],
				'target'        => $result['target'],
                'email'        => $result['email'],
                'groupname'       => $result['groupname'],
                'delivery'         => $result['delivery'],
                'percent'           => round($result['delivery']/$result['target']*100, 2),
                'now_percent'       => round(($result['target']/365*$sumdate)/$result['target']*100, 2),
                'view'           => $this->url->link('amsystem/booking', 'token=' . $this->session->data['token'] . '&user_id=' . $result['user_id'], 'SSL')
			);
            $data['total_target'] = $data['total_target'] + $result['target'];
            $data['total_delivery'] = $data['total_delivery'] + $result['delivery'];
		}
		$data['total_percent'] = round($data['total_delivery']/$data['total_target']*100, 2);
        $data['total_now_percent'] = round(($data['total_target']/365*$sumdate)/$data['total_target']*100, 2);
        
        
		return $this->load->view('amsystem/dasadmin.tpl', $data);	
	}
}
