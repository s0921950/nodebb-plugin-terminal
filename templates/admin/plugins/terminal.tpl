<div class="row">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">Terminal Admin Page</div>
			<div class="panel-body">
				<form role="form" class="terminal-settings">
					<p>
						Terminal MongoDB settings. 
					</p>
					<div class="form-group">
						<label for="address">Address</label>
						<input type="text" id="address" name="address" title="Address" class="form-control" placeholder="Address">
						<label for="port">Port</label>
						<input type="text" id="port" name="port" title="Port" class="form-control" placeholder="Port">
						<label for="admin_username">Admin Username</label>
						<input type="text" id="admin_username" name="admin_username" title="Admin Username" class="form-control" placeholder="Admin Username">
						<label for="admin_password">Admin Password</label>
						<input type="text" id="admin_password" name="admin_password" title="Admin Password" class="form-control" placeholder="Admin Password">
						<label for="username">Username</label>
						<input type="text" id="username" name="username" title="Username" class="form-control" placeholder="Username">
						<label for="password">Password</label>
						<input type="text" id="password" name="password" title="Password" class="form-control" placeholder="Password">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">Control Panel</div>
			<div class="panel-body">
				<button class="btn btn-primary" id="save">Save Settings</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		console.log('nodebb-plugin-terminal: loaded');
	});
	require(['settings'], function(Settings) {
		Settings.load('terminal', $('.terminal-settings'));
		$('#save').on('click', function() {
			Settings.save('terminal', $('.terminal-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'terminal-saved',
					title: 'Settings Saved',
					message: 'Please reload your NodeBB to apply these settings',
				});
			});
		});
	});
</script>