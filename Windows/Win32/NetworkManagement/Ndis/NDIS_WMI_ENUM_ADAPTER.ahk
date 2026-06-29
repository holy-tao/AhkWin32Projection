#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_ENUM_ADAPTER {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    IfIndex : UInt32

    NetLuid : NET_LUID_LH

    DeviceNameLength : UInt16

    DeviceName : CHAR[1]

}
