#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BSSID_INFO.ahk" { BSSID_INFO }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_PMKID {
    #StructPack 4

    Length : UInt32

    BSSIDInfoCount : UInt32

    BSSIDInfo : BSSID_INFO[1]

}
