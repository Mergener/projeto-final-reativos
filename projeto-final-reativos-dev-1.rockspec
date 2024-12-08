package = "projeto-final-reativos"
version = "dev-1"
source = {
   url = "git+https://github.com/mergener/projeto-final-reativos"
}
description = {
   homepage = "https://github.com/mergener/projeto-final-reativos",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {
      object = "src\\object.lua",
      operator = "src\\operator.lua"
   }
}
