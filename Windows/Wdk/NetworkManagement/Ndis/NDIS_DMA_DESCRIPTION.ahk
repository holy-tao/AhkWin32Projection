#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\SystemServices\DMA_SPEED.ahk" { DMA_SPEED }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\System\SystemServices\DMA_WIDTH.ahk" { DMA_WIDTH }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_DMA_DESCRIPTION {
    #StructPack 4

    DemandMode : BOOLEAN

    AutoInitialize : BOOLEAN

    DmaChannelSpecified : BOOLEAN

    DmaWidth : DMA_WIDTH

    DmaSpeed : DMA_SPEED

    DmaPort : UInt32

    DmaChannel : UInt32

}
