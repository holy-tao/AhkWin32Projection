#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct BSSID_INFO {
    #StructPack 1

    BSSID : Int8[6]

    PMKID : Int8[16]

}
