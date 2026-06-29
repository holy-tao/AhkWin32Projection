#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_RATE_SET.ahk" { WLAN_RATE_SET }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_REALTIME_CONNECTION_QUALITY_LINK_INFO {
    #StructPack 4

    ucLinkID : Int8

    ulChannelCenterFrequencyMhz : UInt32

    ulBandwidth : UInt32

    lRssi : Int32

    wlanRateSet : WLAN_RATE_SET

}
