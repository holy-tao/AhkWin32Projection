#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 */
export default struct URLINVOKECOMMANDINFOA {
    #StructPack 8

    dwcbSize : UInt32

    dwFlags : UInt32

    hwndParent : HWND

    pcszVerb : PSTR

}
