<div class="row section-not-to-print">
    <div class="col-lg-12">
        <div class="row ribbon" style="z-index: 10000">
            <span class="breadcrumbs">
                <i class="fa fa-home fa-fw"></i>
                <?php
                    if($controller != 'itmms')
                        echo ' / ' . preg_replace('/[^a-zA-Z0-9]/', ' ', $controller);
                    if($this->uri->segment(1) == $controller)
                        echo ' / ' . preg_replace('/[^a-zA-Z0-9]/', ' ', $this->uri->segment(2));
                    else
                        echo ' / ' . preg_replace('/[^a-zA-Z0-9]/', ' ', $this->uri->segment(1));
                ?>
            </span>
            <nav class="navbar navbar-default navbar-ribbon pull-right">
                <ul class="nav navbar-ribbon-links visible-lg">
                    <li class="dropdown ribbon-li-rooms">
                        <a href="javascript:void(0)" class="dropdown-toggle ribbon-item" data-toggle="dropdown">
                            &nbsp;Sign Out&nbsp;<span class="fa fa-angle-down">
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li id="settings-lg">
                                <a href="settings" title="Settings"><i class="fa fa-cog fa-fw"></i> Settings</a>
                            <li class="divider"></li>
                            <li>
                                <a href="signout" class="fg-gray" title="Sign out"><i class="fa fa-sign-out fa-fw"></i> <b><small>SIGN OUT</small></b></a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-ribbon-links hidden-lg">
                    <li class="dropdown ribbon-li">
                        <a href="javascript:void(0)" class="dropdown-toggle ribbon-item" data-toggle="dropdown">
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu pull-right" style="min-width: auto;">
                            <li id="settings-sm">
                                <a href="settings"><i class="fa fa-cog fa-fw"></i> Settings</a>
                            </li>
                                <a href="signout" class="fg-gray"><i class="fa fa-sign-out fa-fw"></i> <b><small>SIGN OUT</small></b></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>