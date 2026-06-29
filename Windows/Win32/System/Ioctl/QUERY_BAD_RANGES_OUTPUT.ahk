#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QUERY_BAD_RANGES_OUTPUT_RANGE.ahk" { QUERY_BAD_RANGES_OUTPUT_RANGE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct QUERY_BAD_RANGES_OUTPUT {
    #StructPack 8

    Flags : UInt32

    NumBadRanges : UInt32

    NextOffsetToLookUp : Int64

    BadRanges : QUERY_BAD_RANGES_OUTPUT_RANGE[1]

}
