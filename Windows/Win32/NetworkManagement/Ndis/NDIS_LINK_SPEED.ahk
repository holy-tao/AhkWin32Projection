#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_LINK_SPEED {
    #StructPack 8

    XmitLinkSpeed : Int64

    RcvLinkSpeed : Int64

}
