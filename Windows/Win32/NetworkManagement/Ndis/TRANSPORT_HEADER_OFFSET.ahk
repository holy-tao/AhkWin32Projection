#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct TRANSPORT_HEADER_OFFSET {
    #StructPack 2

    ProtocolType : UInt16

    HeaderOffset : UInt16

}
