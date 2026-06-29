#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\NDIS_TIMESTAMP_CAPABILITY_FLAGS.ahk" { NDIS_TIMESTAMP_CAPABILITY_FLAGS }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_TIMESTAMP_CAPABILITIES {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    HardwareClockFrequencyHz : Int64

    CrossTimestamp : BOOLEAN

    Reserved1 : Int64

    Reserved2 : Int64

    TimestampFlags : NDIS_TIMESTAMP_CAPABILITY_FLAGS

}
