#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a memory read operation.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_cba_read_memory
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_CBA_READ_MEMORY {
    #StructPack 8

    /**
     * The address to be read.
     */
    addr : Int64

    /**
     * A pointer to a buffer that receives the memory read.
     */
    buf : IntPtr

    /**
     * The number of bytes to read.
     */
    bytes : UInt32

    /**
     * A pointer to a variable that receives the number of bytes read.
     */
    bytesread : IntPtr

}
