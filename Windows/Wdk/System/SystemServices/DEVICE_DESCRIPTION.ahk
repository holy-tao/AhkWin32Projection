#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\INTERFACE_TYPE.ahk" { INTERFACE_TYPE }
#Import ".\DMA_SPEED.ahk" { DMA_SPEED }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DMA_WIDTH.ahk" { DMA_WIDTH }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_DESCRIPTION {
    #StructPack 8

    Version : UInt32

    Master : BOOLEAN

    ScatterGather : BOOLEAN

    DemandMode : BOOLEAN

    AutoInitialize : BOOLEAN

    Dma32BitAddresses : BOOLEAN

    IgnoreCount : BOOLEAN

    Reserved1 : BOOLEAN

    Dma64BitAddresses : BOOLEAN

    BusNumber : UInt32

    DmaChannel : UInt32

    InterfaceType : INTERFACE_TYPE

    DmaWidth : DMA_WIDTH

    DmaSpeed : DMA_SPEED

    MaximumLength : UInt32

    DmaPort : UInt32

    DmaAddressWidth : UInt32

    DmaControllerInstance : UInt32

    DmaRequestLine : UInt32

    DeviceAddress : Int64

}
