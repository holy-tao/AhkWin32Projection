#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DNS_CONNECTION_PROXY_INFO.ahk" { DNS_CONNECTION_PROXY_INFO }
#Import ".\DNS_CONNECTION_PROXY_INFO_SWITCH.ahk" { DNS_CONNECTION_PROXY_INFO_SWITCH }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_PROXY_INFO_EX {
    #StructPack 8

    ProxyInfo : DNS_CONNECTION_PROXY_INFO

    dwInterfaceIndex : UInt32

    pwszConnectionName : PWSTR

    fDirectConfiguration : BOOL

    hConnection : HANDLE

}
