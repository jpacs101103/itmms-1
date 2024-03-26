<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| DEFAULT CI ROUTES
| -------------------------------------------------------------------------
*/

$route['default_controller'] = 'login/index';
$route['404_override'] = 'errors/page_not_found';
$route['translate_uri_dashes'] = FALSE;
$route['register'] = 'register/index';


/*
| -------------------------------------------------------------------------
| #ERROR ROUTES FOR DIRECT ACCESSING
| -------------------------------------------------------------------------
*/

$route['itmms'] = "errors/page_not_found";
$route['itmms/(.*)'] = "errors/page_not_found";

$route['classroom'] = "errors/page_not_found";
$route['classroom/(.*)'] = "errors/page_not_found";

$route['cluster'] = "errors/page_not_found";
$route['cluster/(.*)'] = "errors/page_not_found";

$route['computer'] = "errors/page_not_found";
$route['computer/(.*)'] = "errors/page_not_found";

$route['report'] = "errors/page_not_found";
$route['report/(.*)'] = "errors/page_not_found";

$route['service_order'] = "errors/page_not_found";
$route['service_order/(.*)'] = "errors/page_not_found";

$route['user'] = "errors/page_not_found";
$route['user/(.*)'] = "errors/page_not_found";

/*
| -------------------------------------------------------------------------
| #ERROR ROUTES FOR FORBBIDEN METHODS
| -------------------------------------------------------------------------
*/

$route['403'] = "errors/access_denied";

/*
| -------------------------------------------------------------------------
| ROUTE FOR #MODAL
| -------------------------------------------------------------------------
*/

$route['modal/(:any)'] = 'ajax_itmms/modal/$1';

/*
| -------------------------------------------------------------------------
| ROUTE FOR #LOGIN
| -------------------------------------------------------------------------
*/

$route['signout'] = 'login/signout';

/*
| -------------------------------------------------------------------------
| ROUTE FOR #itmms
| -------------------------------------------------------------------------
*/

$route['dashboard'] = 'itmms/dashboard';
$route['pending-services'] = 'itmms/pending_services';
$route['ROF-pending'] = 'itmms/ROF_pending';
$route['tasks'] = 'itmms/tasks';
$route['help'] = 'itmms/help';
$route['about'] = 'itmms/about';
$route['terms'] = 'itmms/terms';

/*
| -------------------------------------------------------------------------
| ROUTE FOR #USER
| -------------------------------------------------------------------------
*/

$route['new/user'] = 'user/user';
$route['manage/users'] = 'user/user_list';
$route['settings'] = 'user/settings';

/*
| -------------------------------------------------------------------------
| ROUTE FOR #SERVICE ORDER
| -------------------------------------------------------------------------
*/

$route['new/service-order'] = 'service_order/service_order';
$route['manage/service-orders'] = 'service_order/service_order_list';

/*
| -------------------------------------------------------------------------
|  ROUTE FOR #CLASSROOM
| -------------------------------------------------------------------------
*/

$route['new/classroom'] = 'classroom/classroom';
$route['laboratory/(:any)'] = 'classroom/laboratory_ws/$1/$2';
$route['lecture/(:any)'] = 'classroom/eroom_ws/$1/$2';

/*
| -------------------------------------------------------------------------
| ROUTE FOR #CLUSTER
| -------------------------------------------------------------------------
*/

$route['new/cluster'] = 'cluster/cluster';
$route['manage/clusters'] = 'cluster/cluster_list';
$route['department/(:any)'] = 'cluster/department_ws/$1/$2';
$route['office/(:any)'] = 'cluster/office_ws/$1/$2';

/*
| -------------------------------------------------------------------------
| ROUTE FOR #COMPUTER
| -------------------------------------------------------------------------
*/

$route['new/computer'] = 'computer/computer';
$route['manage/computers'] = 'computer/computer_list';
$route['new/resource'] = 'computer/computer_resource';
$route['manage/resources'] = 'computer/computer_resource_list';

/*
| -------------------------------------------------------------------------
| ROUTE FOR #REPORT
| -------------------------------------------------------------------------
*/

$route['service-order-report'] = 'report/service_order_report';
$route['software-reports'] = 'report/software_report';
$route['hardware-reports'] = 'report/hardware_report';
$route['classroom-report'] = 'report/classroom_report';
$route['cluster-report'] = 'report/cluster_report';

/*
| -------------------------------------------------------------------------
| ROUTE FOR #MONITORING
| -------------------------------------------------------------------------
*/

$route['monitoring'] = 'monitoring/monitoring';
$route['monitoring/(:any)'] = 'monitoring/monitoring_view_parts/$1';
