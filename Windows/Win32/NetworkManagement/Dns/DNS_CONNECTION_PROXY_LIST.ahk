#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_CONNECTION_PROXY_ELEMENT.ahk" { DNS_CONNECTION_PROXY_ELEMENT }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_PROXY_LIST {
    #StructPack 8

    cProxies : UInt32

    pProxies : DNS_CONNECTION_PROXY_ELEMENT.Ptr

}
