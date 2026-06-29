#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_WAN_PROTOCOL_CAPS {
    #StructPack 4

    Flags : UInt32

    Reserved : UInt32

}
