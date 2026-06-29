#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct PMKID_CANDIDATE {
    #StructPack 4

    BSSID : Int8[6]

    Flags : UInt32

}
