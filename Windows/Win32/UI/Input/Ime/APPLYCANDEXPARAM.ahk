#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct APPLYCANDEXPARAM {
    #StructPack 8

    dwSize : UInt32

    lpwstrDisplay : PWSTR

    lpwstrReading : PWSTR

    dwReserved : UInt32

}
