#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_QUERY_RAW_CANCEL {
    #StructPack 2

    reserved : CHAR[32]

}
