#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_FRAMING_RANGE.ahk" { KS_FRAMING_RANGE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_FRAMING_RANGE_WEIGHTED {
    #StructPack 4

    Range : KS_FRAMING_RANGE

    InPlaceWeight : UInt32

    NotInPlaceWeight : UInt32

}
