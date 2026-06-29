#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_CERT_CONFIG_ENTRY {
    #StructPack 2

    CertHash : Int8[20]

    CertStoreName : WCHAR[128]

}
