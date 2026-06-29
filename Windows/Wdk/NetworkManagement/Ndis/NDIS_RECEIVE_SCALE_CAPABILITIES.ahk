#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_RECEIVE_SCALE_CAPABILITIES {
    #StructPack 8

    Header : IntPtr

    CapabilitiesFlags : UInt32

    NumberOfInterruptMessages : UInt32

    NumberOfReceiveQueues : UInt32

}
