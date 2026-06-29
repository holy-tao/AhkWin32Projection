#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_IP_OPER_STATE {
    #StructPack 8

    Header : IntPtr

    Flags : UInt32

    IpOperationalStatus : IntPtr

}
