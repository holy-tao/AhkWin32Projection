#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_TYPE.ahk" { DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_TYPE }
#Import ".\DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_ACCESS_TYPE.ahk" { DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_ACCESS_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION {
    #StructPack 8


    struct _LogicalAddressLimits {
        MinimumAddress : Int64

        MaximumAddress : Int64

    }

    struct _SubSection {
        Offset : Int64

        Length : UInt32

    }

    ConfigType : DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_TYPE

    LogicalAddressLimits : DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION._LogicalAddressLimits

    static __New() {
        DefineProp(this.Prototype, 'SubSection', { type: DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION._SubSection, offset: 8 })
        DefineProp(this.Prototype, 'HardwareAccessType', { type: DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION_ACCESS_TYPE, offset: 8 })
        DefineProp(this.Prototype, 'Reserved', { type: Int64[4], offset: 8 })
        this.DeleteProp("__New")
    }
}
