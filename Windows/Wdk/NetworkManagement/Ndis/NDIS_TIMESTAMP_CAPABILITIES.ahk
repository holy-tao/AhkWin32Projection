#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_TIMESTAMP_CAPABILITIES {
    #StructPack 8

    Header : IntPtr

    HardwareClockFrequencyHz : Int64

    CrossTimestamp : BOOLEAN

    Reserved1 : Int64

    Reserved2 : Int64

    TimestampFlags : IntPtr

}
