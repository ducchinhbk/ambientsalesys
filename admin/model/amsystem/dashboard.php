<?php
class ModelAmsystemDashboard extends Model {
    
    public function get_team_members()
    {
		$sql = "SELECT u.user_id, u.image, CONCAT(u.firstname, ' ', u.lastname) AS fullname, u.target, email,
            	(SELECT ug.name FROM user_group ug WHERE ug.user_group_id = u.user_group_id) AS groupname,
            	(SELECT SUM(book_val) FROM ams_booking bo WHERE bo.user_id = u.user_id) AS delivery
            FROM `user` u
            WHERE u.`user_group_id` != 1";

		$query = $this->db->query($sql);

		return $query->rows;
	
    }
    
    public function get_group_team_members($admin_group)
    {
		$sql = "SELECT u.user_id, u.image, CONCAT(u.firstname, ' ', u.lastname) AS fullname, u.target, email,
            	(SELECT ug.name FROM user_group ug WHERE ug.user_group_id = u.user_group_id) AS groupname,
            	(SELECT SUM(book_val) FROM ams_booking bo WHERE bo.user_id = u.user_id) AS delivery
            FROM `user` u
            WHERE u.`user_group_id` = ".$admin_group." and u.`admin_group_id` != ".$admin_group."";

		$query = $this->db->query($sql);

		return $query->rows;
	
    }
}