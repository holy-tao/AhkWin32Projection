#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_ADAPTER_INFO_V1 {
    #StructPack 4

    ReadDmaCounterAvailable : UInt32

    ScatterGatherLimit : UInt32

    DmaAddressWidth : UInt32

    Flags : UInt32

    MinimumTransferUnit : UInt32

}
