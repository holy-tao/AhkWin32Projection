#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_WMI_METHOD_HEADER {
    #StructPack 8

    Header : IntPtr

    PortNumber : UInt32

    NetLuid : IntPtr

    RequestId : Int64

    Timeout : UInt32

    Padding : Int8[4]

}
