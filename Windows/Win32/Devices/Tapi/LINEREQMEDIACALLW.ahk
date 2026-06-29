#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @charset Unicode
 */
export default struct LINEREQMEDIACALLW {
    #StructPack 8

    hWnd : HWND

    wRequestID : WPARAM

    szDeviceClass : WCHAR[40]

    ucDeviceID : Int8[40]

    dwSize : UInt32

    dwSecure : UInt32

    szDestAddress : WCHAR[80]

    szAppName : WCHAR[40]

    szCalledParty : WCHAR[40]

    szComment : WCHAR[80]

}
