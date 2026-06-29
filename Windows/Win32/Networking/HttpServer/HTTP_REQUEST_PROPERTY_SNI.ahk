#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_PROPERTY_SNI {
    #StructPack 4

    Hostname : WCHAR[256]

    Flags : UInt32

}
