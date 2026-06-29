#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_OPERATIONS.ahk" { DMA_OPERATIONS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_ADAPTER {
    #StructPack 8

    Version : UInt16

    Size : UInt16

    DmaOperations : DMA_OPERATIONS.Ptr

}
