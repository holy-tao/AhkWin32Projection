#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\COR_PRF_GC_GENERATION.ahk" { COR_PRF_GC_GENERATION }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_GC_GENERATION_RANGE {
    #StructPack 8

    generation : COR_PRF_GC_GENERATION

    rangeStart : IntPtr

    rangeLength : IntPtr

    rangeLengthReserved : IntPtr

}
