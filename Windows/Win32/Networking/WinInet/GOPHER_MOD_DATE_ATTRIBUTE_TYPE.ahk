#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct GOPHER_MOD_DATE_ATTRIBUTE_TYPE {
    #StructPack 4

    DateAndTime : FILETIME

}
