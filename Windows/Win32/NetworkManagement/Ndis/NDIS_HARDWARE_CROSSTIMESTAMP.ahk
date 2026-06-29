#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_HARDWARE_CROSSTIMESTAMP {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    Flags : UInt32

    SystemTimestamp1 : Int64

    HardwareClockTimestamp : Int64

    SystemTimestamp2 : Int64

}
