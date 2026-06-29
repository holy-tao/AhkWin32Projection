#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\NET_LUID_LH.ahk" { NET_LUID_LH }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_EVENT_HEADER {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    IfIndex : UInt32

    NetLuid : NET_LUID_LH

    RequestId : Int64

    PortNumber : UInt32

    DeviceNameLength : UInt32

    DeviceNameOffset : UInt32

    Padding : Int8[4]

}
