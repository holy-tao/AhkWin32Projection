#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WININET_PROXY_INFO.ahk" { WININET_PROXY_INFO }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct WININET_PROXY_INFO_LIST {
    #StructPack 8

    dwProxyInfoCount : UInt32

    pProxyInfo : WININET_PROXY_INFO.Ptr

}
