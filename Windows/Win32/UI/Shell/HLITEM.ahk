#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLITEM {
    #StructPack 8

    uHLID : UInt32

    pwzFriendlyName : PWSTR

}
