#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMESTRINGCANDIDATE {
    #StructPack 8

    uCount : UInt32

    lpwstr : PWSTR[1]

}
