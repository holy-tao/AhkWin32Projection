#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_RATE_SET.ahk" { WLAN_RATE_SET }
#Import ".\DOT11_PHY_TYPE.ahk" { DOT11_PHY_TYPE }
#Import ".\WLAN_REALTIME_CONNECTION_QUALITY_LINK_INFO.ahk" { WLAN_REALTIME_CONNECTION_QUALITY_LINK_INFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_REALTIME_CONNECTION_QUALITY {
    #StructPack 4

    dot11PhyType : DOT11_PHY_TYPE

    ulLinkQuality : UInt32

    ulRxRate : UInt32

    ulTxRate : UInt32

    bIsMLOConnection : BOOL

    ulNumLinks : UInt32

    linksInfo : WLAN_REALTIME_CONNECTION_QUALITY_LINK_INFO[1]

}
