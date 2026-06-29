#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_HARDWARE_CROSSTIMESTAMP {
    #StructPack 8

    Header : IntPtr

    Flags : UInt32

    SystemTimestamp1 : Int64

    HardwareClockTimestamp : Int64

    SystemTimestamp2 : Int64

}
