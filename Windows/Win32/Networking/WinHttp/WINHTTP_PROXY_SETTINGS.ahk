#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\WINHTTP_PROXY_NETWORKING_KEY.ahk" { WINHTTP_PROXY_NETWORKING_KEY }

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_PROXY_SETTINGS {
    #StructPack 8

    dwStructSize : UInt32

    dwFlags : UInt32

    dwCurrentSettingsVersion : UInt32

    pwszConnectionName : PWSTR

    pwszProxy : PWSTR

    pwszProxyBypass : PWSTR

    pwszAutoconfigUrl : PWSTR

    pwszAutoconfigSecondaryUrl : PWSTR

    dwAutoDiscoveryFlags : UInt32

    pwszLastKnownGoodAutoConfigUrl : PWSTR

    dwAutoconfigReloadDelayMins : UInt32

    ftLastKnownDetectTime : FILETIME

    dwDetectedInterfaceIpCount : UInt32

    pdwDetectedInterfaceIp : IntPtr

    cNetworkKeys : UInt32

    pNetworkKeys : WINHTTP_PROXY_NETWORKING_KEY.Ptr

}
