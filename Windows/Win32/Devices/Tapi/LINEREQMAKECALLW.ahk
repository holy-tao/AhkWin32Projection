#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @charset Unicode
 */
export default struct LINEREQMAKECALLW {
    #StructPack 2

    szDestAddress : WCHAR[80]

    szAppName : WCHAR[40]

    szCalledParty : WCHAR[40]

    szComment : WCHAR[80]

}
