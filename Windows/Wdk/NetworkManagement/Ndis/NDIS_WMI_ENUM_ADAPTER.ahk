#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_ENUM_ADAPTER {
    #StructPack 8

    Header : IntPtr

    IfIndex : UInt32

    NetLuid : IntPtr

    DeviceNameLength : UInt16

    DeviceName : CHAR[1]

}
