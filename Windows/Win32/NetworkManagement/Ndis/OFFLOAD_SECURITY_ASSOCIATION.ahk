#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OFFLOAD_ALGO_INFO.ahk" { OFFLOAD_ALGO_INFO }
#Import ".\OFFLOAD_OPERATION_E.ahk" { OFFLOAD_OPERATION_E }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct OFFLOAD_SECURITY_ASSOCIATION {
    #StructPack 4

    Operation : OFFLOAD_OPERATION_E

    SPI : UInt32

    IntegrityAlgo : OFFLOAD_ALGO_INFO

    ConfAlgo : OFFLOAD_ALGO_INFO

    Reserved : OFFLOAD_ALGO_INFO

}
