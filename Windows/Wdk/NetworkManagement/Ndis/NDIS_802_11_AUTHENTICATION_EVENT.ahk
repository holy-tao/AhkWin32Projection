#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_AUTHENTICATION_EVENT {
    #StructPack 8

    Status : IntPtr

    Request : IntPtr[1]

}
