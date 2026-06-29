#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_WEP {
    #StructPack 4

    Length : UInt32

    KeyIndex : UInt32

    KeyLength : UInt32

    KeyMaterial : Int8[1]

}
