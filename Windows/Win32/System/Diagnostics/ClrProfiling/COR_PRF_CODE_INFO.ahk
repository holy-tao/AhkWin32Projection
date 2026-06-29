#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_CODE_INFO {
    #StructPack 8

    startAddress : IntPtr

    size : IntPtr

}
