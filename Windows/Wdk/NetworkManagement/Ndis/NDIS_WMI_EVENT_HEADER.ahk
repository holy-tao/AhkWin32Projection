#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_EVENT_HEADER {
    #StructPack 8

    Header : IntPtr

    IfIndex : UInt32

    NetLuid : IntPtr

    RequestId : Int64

    PortNumber : UInt32

    DeviceNameLength : UInt32

    DeviceNameOffset : UInt32

    Padding : Int8[4]

}
