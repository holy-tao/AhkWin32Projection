#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_CONNECTION_NAME.ahk" { DNS_CONNECTION_NAME }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_NAME_LIST {
    #StructPack 8

    cNames : UInt32

    pNames : DNS_CONNECTION_NAME.Ptr

}
