#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_FRAMING_RANGE.ahk" { KS_FRAMING_RANGE }
#Import ".\KS_FRAMING_ITEM.ahk" { KS_FRAMING_ITEM }
#Import ".\KS_COMPRESSION.ahk" { KS_COMPRESSION }
#Import ".\KS_FRAMING_RANGE_WEIGHTED.ahk" { KS_FRAMING_RANGE_WEIGHTED }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSALLOCATOR_FRAMING_EX {
    #StructPack 4

    CountItems : UInt32

    PinFlags : UInt32

    OutputCompression : KS_COMPRESSION

    PinWeight : UInt32

    FramingItem : KS_FRAMING_ITEM[1]

}
