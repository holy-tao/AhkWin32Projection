#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_CONNECTION_PROXY_TYPE.ahk" { DNS_CONNECTION_PROXY_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DNS_CONNECTION_PROXY_INFO.ahk" { DNS_CONNECTION_PROXY_INFO }
#Import ".\DNS_CONNECTION_PROXY_INFO_SWITCH.ahk" { DNS_CONNECTION_PROXY_INFO_SWITCH }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_PROXY_ELEMENT {
    #StructPack 8

    Type : DNS_CONNECTION_PROXY_TYPE

    Info : DNS_CONNECTION_PROXY_INFO

}
