#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_IP_OPER_STATUS_INFO {
    #StructPack 8

    Header : IntPtr

    Flags : UInt32

    NumberofAddressFamiliesReturned : UInt32

    IpOperationalStatus : IntPtr[32]

}
