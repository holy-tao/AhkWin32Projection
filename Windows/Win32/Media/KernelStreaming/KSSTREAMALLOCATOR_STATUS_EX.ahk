#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_FRAMING_RANGE.ahk" { KS_FRAMING_RANGE }
#Import ".\KS_FRAMING_ITEM.ahk" { KS_FRAMING_ITEM }
#Import ".\KS_COMPRESSION.ahk" { KS_COMPRESSION }
#Import ".\KS_FRAMING_RANGE_WEIGHTED.ahk" { KS_FRAMING_RANGE_WEIGHTED }
#Import ".\KSALLOCATOR_FRAMING_EX.ahk" { KSALLOCATOR_FRAMING_EX }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSSTREAMALLOCATOR_STATUS_EX {
    #StructPack 4

    Framing : KSALLOCATOR_FRAMING_EX

    AllocatedFrames : UInt32

    Reserved : UInt32

}
