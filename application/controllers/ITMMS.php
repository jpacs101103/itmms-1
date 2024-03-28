<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class itmms extends MY_Controller {
    public function __construct() {

        # Load Models
        $this->models = array('service_order', 'user', 'cluster', 'classroom', 'computer');

        parent::__construct();

        # Load itmms Session Data
        $this->get_session_data();

        # Check if user is currently logged in
        if(!$this->data['sess_is_logged_in']) {
            redirect( base_url() );
        }
    }

    public function dashboard() {
        $this->template = 'includes/layout';

        $this
             //Styles
             ->add_local_styles('assets/css/morris/morris')
             ->add_local_styles('assets/css/datatables/datatables-bootstrap')
             ->add_local_styles('assets/css/datatables/responsive.bootstrap', TRUE)
             // Scripts
             ->add_local_scripts('assets/js/raphael/raphael', TRUE)
             ->add_local_scripts('assets/js/morris/morris', TRUE)
             ->add_local_scripts('assets/js/fullscreen/fullscreen')
             ->add_local_scripts('assets/js/prettydate/prettydate')
             ->add_local_scripts('assets/js/print/jQuery.print')
             ->add_local_scripts('assets/js/itmms/itmms/dashboard')
             ->add_local_scripts('assets/js/datatables/datatables-jquery')
             ->add_local_scripts('assets/js/datatables/datatables-bootstrap', TRUE)
             ->add_local_scripts('assets/js/datatables/dataTables.responsive', TRUE)
             ->add_local_scripts('assets/js/moment/moment')
             ->add_local_scripts('assets/js/tippy/popper')
             ->add_local_scripts('assets/js/tippy/tippy')
             ->add_local_scripts('assets/js/itmms/itmms/pending_services')
             ->add_local_scripts('assets/js/itmms/itmms/low_health_devices');
    }

   /* public function pending_services() {
        $this->template = 'includes/layout';

        $this
             // Styles
             ->add_local_styles('assets/css/datatables/datatables-bootstrap')
             ->add_local_styles('assets/css/datatables/responsive.bootstrap', TRUE)
             // Scripts
             ->add_local_scripts('assets/js/datatables/datatables-jquery')
             ->add_local_scripts('assets/js/datatables/datatables-bootstrap', TRUE)
             ->add_local_scripts('assets/js/datatables/dataTables.responsive', TRUE)
             ->add_local_scripts('assets/js/itmms/itmms/pending_services');
    }*/

    /*public function ROF_pending(){
        $this->template = 'includes/layout';

        $this
             // Styles
             ->add_local_styles('assets/css/datatables/datatables-bootstrap')
             ->add_local_styles('assets/css/datatables/responsive.bootstrap', TRUE)
             // Scripts
             ->add_local_scripts('assets/js/datatables/datatables-jquery')
             ->add_local_scripts('assets/js/datatables/datatables-bootstrap', TRUE)
             ->add_local_scripts('assets/js/datatables/dataTables.responsive', TRUE)
             ->add_local_scripts('assets/js/itmms/itmms/rof_pending');
    }*/

    public function tasks() {
        if($this->data['sess_access_rights'] === 'view' || $this->data['sess_access_rights'] === 'add' ) {
            redirect( '403' );
        }
        else {
            $this->template = 'includes/layout';

            $this
                 // Styles
                 ->add_local_styles('assets/css/datatables/datatables-bootstrap')
                 ->add_local_styles('assets/css/datatables/responsive.bootstrap', TRUE)
                 // Scripts
                 ->add_local_scripts('assets/js/datatables/datatables-jquery')
                 ->add_local_scripts('assets/js/datatables/datatables-bootstrap', TRUE)
                 ->add_local_scripts('assets/js/datatables/dataTables.responsive', TRUE)
                 ->add_local_scripts('assets/js/itmms/itmms/task');
        }
    }

    public function help() {
        $this->template = 'includes/layout';

        $this->add_local_styles('assets/css/itmms/scrollspy');
    }

    public function about() {
        $this->template = 'includes/layout';
    }

    public function terms() {
        $this->template = 'includes/layout';
    }

    public function monitoring() {
        $this->template = 'includes/layout';
    }

}
