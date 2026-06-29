#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COR_PRF_FUNCTION_ARGUMENT_RANGE.ahk" { COR_PRF_FUNCTION_ARGUMENT_RANGE }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_FUNCTION_ARGUMENT_INFO {
    #StructPack 8

    numRanges : UInt32

    totalArgumentSize : UInt32

    ranges : COR_PRF_FUNCTION_ARGUMENT_RANGE[1]

}
