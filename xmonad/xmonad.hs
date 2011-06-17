import XMonad
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.CustomKeys

main = xmonad defaultConfig
    { modMask = mod4Mask
    , terminal = "konsole"    
    , normalBorderColor = "gray30"
    , focusedBorderColor = "#aecf96"
    , borderWidth = 1
    , manageHook = myManageHook
    , layoutHook = myLayoutHook
    , workspaces = ["1:yi", "2:web", "3:dev", "4:dev", "5:tmp", "6:tmp", "7:tmp", "8:tmp", "9:comm"]
    , keys = customKeys delkeys inskeys
    } 
    where
        delkeys :: XConfig l -> [(KeyMask, KeySym)]
        delkeys XConfig {modMask = modm} =
            -- we're preferring Futurama to Xinerama here
            --[ (modm .|. m, k) | (m, k) <- zip [0, shiftMask] [xK_w, xK_e, xK_r] ]
            [
            ]

        inskeys :: XConfig l -> [((KeyMask, KeySym), X ())]
        inskeys conf@(XConfig {modMask = modm}) =
            [ ((modm .|. controlMask, xK_l ), spawn "xscreensaver-command -lock")
            ]

myLayoutHook = smartBorders $ avoidStruts $ tiled ||| Mirror tiled ||| Full
    where
        tiled   = Tall nmaster delta ratio
        nmaster = 1
        ratio   = 1/2
        delta   = 4/100

-- find class name with xprop | grep CLASS
myManageHook = composeAll
        [ floatC "MPlayer"
        , floatC "Gimp"
        , moveToC "Chromium-browser" "2"
        ]
    where moveToC c w = className =? c --> doF (W.shift w)
          moveToT t w = title     =? t --> doF (W.shift w)
          floatC  c   = className =? c --> doFloat

