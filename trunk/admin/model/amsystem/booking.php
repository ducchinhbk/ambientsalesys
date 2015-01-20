<?php
class ModelAmsystemBooking extends Model {
	public function addBooking($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "ams_booking SET  client = '" . $this->db->escape($data['client']) . "', startdate = '" . $this->db->escape($data['startdate']) . "', enddate = '" . $this->db->escape($data['enddate']) . "', 
                                    book_val = '" . $this->db->escape($data['book_val']) . "', status = '" . $this->db->escape($data['status']) . "', note = '" . (int)$data['note'] . "',  date_added = NOW(), user_id = '" . (int)$data['user_id'] . "' ");

		$booking_id = $this->db->getLastId();

	}
    
    public function getBooking($booking_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM ams_booking WHERE booking_id = '" . (int)$booking_id . "'");

		return $query->row;
	}
    
	public function editBooking($booking_id, $data) {
		$this->db->query("UPDATE ams_booking SET  client = '" . $this->db->escape($data['client']) . "', startdate = '" . $this->db->escape($data['startdate']) . "', enddate = '" . $this->db->escape($data['enddate']) . "', 
                                                book_val = '" . $this->db->escape($data['book_val']) . "', status = '" . $this->db->escape($data['status']) . "', note = '" . (int)$data['note'] . "' WHERE booking_id = '" . (int)$booking_id . "'");

	}
    public function deleteBooking($booking_id) {
		$this->db->query("DELETE FROM ams_booking WHERE booking_id = '" . (int)$booking_id . "'");
	}
    
    public function getBookings($user_id) {
		$sql = "SELECT * 
                FROM ams_booking
                WHERE user_id = '" . (int)$user_id . "' ";

		$query = $this->db->query($sql);

		return $query->rows;
	}
    
    public function getTotalBookings($user_id) {
		$sql = "SELECT COUNT(*) AS total FROM ams_booking WHERE user_id = '" . (int)$user_id . "' ";

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

}