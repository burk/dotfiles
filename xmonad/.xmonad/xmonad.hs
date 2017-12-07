import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.Fullscreen

main = xmonad 
	$ fullscreenSupport
	$ gnomeConfig {
		modMask = mod4Mask
	} `additionalKeys` [ ((mod4Mask, xK_p), spawn "dmenu_run -b") ]
