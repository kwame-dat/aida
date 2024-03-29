<?php 
include "config/init.php"; 
if($login->isLoggedIn())
    header("Location: index.php");

$token = $register->socialToken();
AIDASession::set('as_social_token', $token);
$register->botProtection();
?>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Advance Internet Development A - PHP MySQL Register/Login System">
        <meta name="author" content="Tony Ampomah">
        <title>Login | Advance Internet Development A</title>
        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        
        <link rel='stylesheet' href='assets/css/bootswatch.css' type='text/css' media='all' />
        <script type="text/javascript" src="assets/js/bootstrap.min3.js"></script>
        <link rel='stylesheet' href='lib/css/style3.css' type='text/css' media='all' />
       
        <link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet">
        <script type="text/javascript" src="assets/js/respond.min.js"></script>
        <script type="text/javascript">
            var SUCCESS_LOGIN_REDIRECT = "<?php echo SUCCESS_LOGIN_REDIRECT; ?>";
            var $_lang = <?php echo AIDALang::all(); ?>;
        </script>
        
    </head>
    <body>
        <div class="container">
         <div class="modal" id="loginModal">
             <div class="modal-dialog" >
                 <div class="modal-content">
          <div class="modal-header">
            <h3 class="text-center"><?php echo WEBSITE_NAME; ?></h3>
          </div>
          <div class="modal-body">
            <div class="well">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#login" data-toggle="tab"><?php echo AIDALang::get('login'); ?></a></li>
                <li><a href="#create" data-toggle="tab"><?php echo AIDALang::get('create_account'); ?></a></li>
                <li><a href="#forgot" data-toggle="tab"><?php echo AIDALang::get('forgot_password'); ?></a></li>
                <li><a href="index.php" ><?php echo "Back to Homepage"; ?></a></li>
              </ul>
              <div id="myTabContent" class="tab-content">
                <div class="tab-pane active in" id="login">
                  <form class="form-horizontal">
                    <fieldset>
                      
                        <legend class=""><?php echo AIDALang::get('login'); ?></legend>
                         
                      <div class="control-group form-group">
                        <!-- Username -->
                        <label class="control-label col-lg-4"  for="login-username"><?php echo AIDALang::get('username'); ?></label>
                        <div class="controls col-lg-8">
                          <input type="text" id="login-username" name="username" placeholder="" class="input-xlarge form-control"> <br />
                        </div>
                      </div>

                      <div class="control-group form-group">
                        <!-- Password-->
                        <label class="control-label col-lg-4" for="login-password"><?php echo AIDALang::get('password'); ?></label>
                        <div class="controls col-lg-8">
                          <input type="password" id="login-password" name="password" placeholder="" class="input-xlarge form-control">
                        </div>
                      </div>
 
 
                      <div class="control-group form-group">
                        <!-- Button -->
                        <div class="controls col-lg-offset-4 col-lg-8">
                          <button id="btn-login" class="btn btn-success"><?php echo AIDALang::get('login'); ?></button>
                        </div>
                      </div>
                    </fieldset>
                  </form>                
                </div>
                <div class="tab-pane fade" id="create">
                  <form class="form-horizontal register-form" id="tab">
                      <fieldset>
                       
                          <legend class=""><?php echo AIDALang::get('create_account'); ?></legend>
                        

                        <div class="control-group  form-group">
                            <label class="control-label col-lg-4" for='reg-email' ><?php echo AIDALang::get('email'); ?> <span class="required">*</span></label>
                            <div class="controls col-lg-8">
                                <input type="text" id="reg-email" class="input-xlarge form-control">
                            </div>
                        </div>

                        <div class="control-group  form-group">
                            <label class="control-label col-lg-4" for="reg-username"><?php echo AIDALang::get('username'); ?> <span class="required">*</span></label>
                            <div class="controls col-lg-8">
                                <input type="text" id="reg-username" class="input-xlarge form-control">
                            </div>
                        </div>

                        <div class="control-group  form-group">
                            <label class="control-label col-lg-4" for="reg-password"><?php echo AIDALang::get('password'); ?> <span class="required">*</span></label>
                            <div class="controls col-lg-8">
                                <input type="password" id="reg-password" class="input-xlarge form-control">
                            </div>
                        </div>

                        <div class="control-group  form-group">
                            <label class="control-label col-lg-4" for="reg-repeat-password"><?php echo AIDALang::get('repeat_password'); ?> <span class="required">*</span></label>
                            <div class="controls col-lg-8">
                                <input type="password" id="reg-repeat-password" class="input-xlarge form-control">
                            </div>
                        </div>
                          
                        <div class="control-group  form-group">
                            <label class="control-label col-lg-4" for="reg-bot-sum">
                                <?php echo AIDASession::get("bot_first_number"); ?> +
                                <?php echo AIDASession::get("bot_second_number"); ?>
                                <span class="required">*</span>
                            </label>
                            <div class="controls col-lg-8">
                                <input type="text" id="reg-bot-sum" class="input-xlarge form-control">
                            </div>
                        </div>

                        <div class="control-group  form-group">
                            <div class="controls col-lg-offset-4 col-lg-8">
                                <button id="btn-register" class="btn btn-success"><?php echo AIDALang::get('create_account'); ?></button>
                            </div>
                        </div>
                       </fieldset>
                  </form>
                </div>
                
                  <div class="tab-pane in" id="forgot">
                        <form class="form-horizontal" id="forgot-pass-form">
                        <fieldset>
                        
                            <legend class=""><?php echo AIDALang::get('forgot_password'); ?></legend>
                              
                          <div class="control-group form-group">
                            <!-- Username -->
                            <label class="control-label col-lg-4"  for="forgot-password-email"><?php echo AIDALang::get('your_email'); ?></label>
                            <div class="controls col-lg-8">
                              <input type="email" id="forgot-password-email" class="input-xlarge form-control">
                            </div>
                          </div>

                          <div class="control-group form-group">
                            <!-- Button -->
                            <div class="controls col-lg-offset-4 col-lg-8">
                              <button id="btn-forgot-password" class="btn btn-success"><?php echo AIDALang::get('reset_password'); ?></button>
                            </div>
                          </div>
                        </fieldset>
                      </form>
                        
                  </div>

                  <div class="social-login">
                      <?php if ( TWITTER_ENABLED ): ?>
                          <a href="socialauth.php?p=twitter&token=<?php echo $token; ?>">
                              <img src="assets/img/twitter.png" class="fade high-opacity" alt="Twitter" title="<?php echo AIDALang::get('login_with'); ?> Twitter"/>
                          </a>
                      <?php endif; ?>
                      <?php if ( FACEBOOK_ENABLED ): ?>
                          <a href="socialauth.php?p=facebook&token=<?php echo $token; ?>">
                              <img src="assets/img/fb.png" class="fade high-opacity" alt="Facebook" title="<?php echo AIDALang::get('login_with'); ?> Facebook"/>
                          </a>
                      <?php endif; ?>
                      <?php if ( GOOGLE_ENABLED ): ?>
                          <a href="socialauth.php?p=google&token=<?php echo $token; ?>">
                              <img src="assets/img/gplus.png" class="fade high-opacity" alt="Google+" title="<?php echo AIDALang::get('login_with'); ?> GooglePlus"/>
                          </a>
                      <?php endif; ?>
                  </div>
            </div>
          </div>
        </div></div>
                 </div>
             </div>
        </div>
            <script type="text/javascript" src="assets/js/sha512.js"></script>
            <script type="text/javascript" src="lib/js/asengine.js"></script>
            <script type="text/javascript" src="lib/js/register.js"></script>
            <script type="text/javascript" src="lib/js/login.js"></script>
            <script type="text/javascript" src="lib/js/passwordreset.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                   $("#loginModal").modal({
                       keyboard: false,
                       backdrop: "static"
                   }); 
                });
            </script>
    </body>
</html>