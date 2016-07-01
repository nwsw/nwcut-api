package = "nwcut"
version = "2.75"
flags = { ee = true }
description = {
	summary = "NWC User Tool Execution Environment",
	detailed = [[NWC User Tool Execution Environment Support]],
	licence = "MIT",
	homepage= "https://forum.noteworthycomposer.com/forum/?board=7.0"
}
api = {
	file = "api.zip"
}
documentation ={
  dir="docs"
}
templates = {
	default = {
		buildpath = {},
		openfile = "clipmode.lua"
	}
}