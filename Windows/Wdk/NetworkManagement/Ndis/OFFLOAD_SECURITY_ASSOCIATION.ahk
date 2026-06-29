#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OFFLOAD_OPERATION_E.ahk" { OFFLOAD_OPERATION_E }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct OFFLOAD_SECURITY_ASSOCIATION {
    #StructPack 8

    Operation : OFFLOAD_OPERATION_E

    SPI : UInt32

    IntegrityAlgo : IntPtr

    ConfAlgo : IntPtr

    Reserved : IntPtr

}
