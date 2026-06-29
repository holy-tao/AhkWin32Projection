#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_FUNCTION_ARGUMENT_RANGE {
    #StructPack 8

    startAddress : IntPtr

    length : UInt32

}
