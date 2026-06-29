#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_TRAFFIC_SELECTOR0.ahk" { IPSEC_TRAFFIC_SELECTOR0 }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TRAFFIC_SELECTOR_POLICY0 {
    #StructPack 8

    flags : UInt32

    numLocalTrafficSelectors : UInt32

    localTrafficSelectors : IPSEC_TRAFFIC_SELECTOR0.Ptr

    numRemoteTrafficSelectors : UInt32

    remoteTrafficSelectors : IPSEC_TRAFFIC_SELECTOR0.Ptr

}
