#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPR_VPN_TRAFFIC_SELECTOR.ahk" { MPR_VPN_TRAFFIC_SELECTOR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_VPN_TRAFFIC_SELECTORS {
    #StructPack 8

    numTsi : UInt32

    numTsr : UInt32

    tsI : MPR_VPN_TRAFFIC_SELECTOR.Ptr

    tsR : MPR_VPN_TRAFFIC_SELECTOR.Ptr

}
