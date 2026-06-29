#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_VARIABLE_IEs {
    #StructPack 1

    ElementID : Int8

    Length : Int8

    data : Int8[1]

}
