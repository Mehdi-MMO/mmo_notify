fx_version 'adamant'
game 'gta5'

ui_page 'html/index.html'

client_scripts {
	'client.lua',
}

server_scripts {
	'server.lua',
}

files {
	'html/*.*',
	'html/sound/*.*'
}

export 'notification'

server_exports { 'svnotification' }