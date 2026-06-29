#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WAN_FRAGMENT {
    #StructPack 1

    RemoteAddress : Int8[6]

    LocalAddress : Int8[6]

}
