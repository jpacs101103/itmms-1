<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends MY_Controller {
    public function __construct() {

        # Load Models
        $this->models = array('service_order', 'user', 'cluster', 'classroom', 'computer');

        parent::__construct();

        # Load itmms Session Data
        $this->get_session_data();
    }
    public function index() {
        if($this->data['sess_is_logged_in'] ) {
            redirect( 'dashboard' );
        }   
        else {
            $this->template = 'includes/register';

            $this
                 // Scripts
                 ->add_local_scripts('assets/js/itmms/register/register');
        }
    }
}
