<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<?php
	require ('../../config.php');
	// File search, dir listing class, with some usefull functions
	require ('../../pdlc.class.php');
	require ('../../guifunctions.php'); // Function for the pdirl gui template
?>
<html lang='en' xml:lang='en' xmlns='http://www.w3.org/1999/xhtml'>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title><?php echo _('Directory listing for '), host(), $_SERVER['REQUEST_URI']; ?></title>
		<link rel="stylesheet" type="text/css" href="<?php echo templateDirectory();?>/style.css" />
	</head>
<body>
	<div id="headerwrap">
		<div id="header">
			<h1><?printBreadcrumb();?></h1>
			<form action="<?php echo scriptPath();?>" method="get">
			<?php // adds the current directory "&directory=blubb/blabl" to the url ?>
			<input type="hidden" name="directory" value="<?php echo currentDirectory();?>" />
			<ul>
				<?php // simple history-back js-command ?>
				<li><a href="javascript:history.back()" onclick="history.back()"><?php imgTagIcon('back', 'Back');?></a></li>
				<li><?php imgTagIcon('parent-disabled', 'Parent');?></li>
				<li><a href="<?php echo scriptDirectory(); ?>"><?php imgTagIcon('home', 'Home Directory')?></li>
				<li><a href="<?php echo $_SERVER['REQUEST_URI']?>"><?php imgTagIcon('reload', 'Reload');?></a></li>
				<li style="color: #0C4F5F">|</li>
				<li>
					<?php imgTagIcon('search', 'Search...')?>
					<input name="gosearch" id="search" type="text" value="<?php echo searchInput()?>" onclick=" if(this.value == '<?php echo _('Search...')?>') { this.value = ''; }" /></li>
			</ul>
			</form>
			<div style="clear:left;"></div>
		</div>
	</div>
	<div id="contentwrap">
		I'm sorry, content not found
	</div>
	<div id="footer">
		<p><small>powered by <a href="http://pdirl.newroots.de/">pdirl - PHP Directory Listing</a>.</small></p>
	</div>
</body>
</html>
