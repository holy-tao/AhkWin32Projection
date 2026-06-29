#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_RECEIVE_SCALE_CAPABILITIES {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    CapabilitiesFlags : UInt32

    NumberOfInterruptMessages : UInt32

    NumberOfReceiveQueues : UInt32

}
