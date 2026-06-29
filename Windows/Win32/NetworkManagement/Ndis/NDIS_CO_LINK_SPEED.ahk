#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_CO_LINK_SPEED {
    #StructPack 4

    Outbound : UInt32

    Inbound : UInt32

}
