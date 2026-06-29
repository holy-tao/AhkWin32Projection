#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_NONGC_HEAP_RANGE {
    #StructPack 8

    rangeStart : IntPtr

    rangeLength : IntPtr

    rangeLengthReserved : IntPtr

}
