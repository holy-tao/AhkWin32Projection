#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.UI.Shell
 * @charset Unicode
 */
export default struct URLINVOKECOMMANDINFOW {
    #StructPack 8

    dwcbSize : UInt32

    dwFlags : UInt32

    hwndParent : HWND

    pcszVerb : PWSTR

}
