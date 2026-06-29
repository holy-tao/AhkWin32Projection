#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QUERY_BAD_RANGES_INPUT_RANGE.ahk" { QUERY_BAD_RANGES_INPUT_RANGE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct QUERY_BAD_RANGES_INPUT {
    #StructPack 8

    Flags : UInt32

    NumRanges : UInt32

    Ranges : QUERY_BAD_RANGES_INPUT_RANGE[1]

}
