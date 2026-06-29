#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct MDAInfo {
    #StructPack 8

    lpMDACaption : PWSTR

    lpMDAMessage : PWSTR

    lpStackTrace : PWSTR

}
