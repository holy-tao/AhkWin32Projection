#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_FRAMING_RANGE.ahk" { KS_FRAMING_RANGE }
#Import ".\KS_COMPRESSION.ahk" { KS_COMPRESSION }
#Import ".\KS_FRAMING_RANGE_WEIGHTED.ahk" { KS_FRAMING_RANGE_WEIGHTED }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct PIPE_TERMINATION {
    #StructPack 4

    Flags : UInt32

    OutsideFactors : UInt32

    Weigth : UInt32

    PhysicalRange : KS_FRAMING_RANGE

    OptimalRange : KS_FRAMING_RANGE_WEIGHTED

    Compression : KS_COMPRESSION

}
