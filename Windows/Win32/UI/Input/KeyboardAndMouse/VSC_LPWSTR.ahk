#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct VSC_LPWSTR {
    #StructPack 8

    vsc : Int8

    pwsz : PWSTR

}
