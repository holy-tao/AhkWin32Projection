#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_PMKID {
    #StructPack 8

    Length : UInt32

    BSSIDInfoCount : UInt32

    BSSIDInfo : IntPtr[1]

}
