#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_TIMEOUT_DPC_REQUEST_CAPABILITIES {
    #StructPack 8

    Header : IntPtr

    Flags : UInt32

    TimeoutArrayLength : UInt32

    TimeoutArray : UInt32[1]

}
