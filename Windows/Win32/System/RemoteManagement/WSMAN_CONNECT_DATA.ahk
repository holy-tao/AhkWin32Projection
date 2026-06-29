#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_DATA.ahk" { WSMAN_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSMAN_DATA_BINARY.ahk" { WSMAN_DATA_BINARY }
#Import ".\WSManDataType.ahk" { WSManDataType }
#Import ".\WSMAN_DATA_TEXT.ahk" { WSMAN_DATA_TEXT }

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_CONNECT_DATA {
    #StructPack 8

    data : WSMAN_DATA

}
