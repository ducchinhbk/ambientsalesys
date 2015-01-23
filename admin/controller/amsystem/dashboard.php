<?php
class ControllerAmsystemDashboard extends Controller {
	public function index() {
		$this->load->language('amsystem/dasadmin');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('amsystem/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('amsystem/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$user_id = $this->session->data['user_id'];
        $this->load->model('amsystem/user');
        $result = $this->model_amsystem_user->getUsergroupByUserID($user_id);
        
        $admin_group = $this->model_amsystem_user->getAdminGroup($user_id);
        
		$data['token'] = $this->session->data['token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
        
        if($result['user_group_id'] == 1){
            $data['content'] = $this->load->controller('amsystem/dasadmin');
           
        }
        else if($admin_group != 0){
            $data['content'] = $this->load->controller('amsystem/dasadgroup');
        }
        else{
            $data['content'] = $this->load->controller('amsystem/dassale');
        }
        
		$data['footer'] = $this->load->controller('common/footer');

		
			
		$this->response->setOutput($this->load->view('amsystem/dashboard.tpl', $data));
	}
}
