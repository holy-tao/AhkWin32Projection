#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\TRANSMSG.ahk" { TRANSMSG }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct TRANSMSGLIST {
    #StructPack 8

    uMsgCount : UInt32

    TransMsg : TRANSMSG[1]

}
