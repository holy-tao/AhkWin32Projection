#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a memory read operation.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_cba_read_memory
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_CBA_READ_MEMORY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The address to be read.
     * @type {Integer}
     */
    addr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a buffer that receives the memory read.
     * @type {Pointer<Void>}
     */
    buf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of bytes to read.
     * @type {Integer}
     */
    bytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a variable that receives the number of bytes read.
     * @type {Pointer<UInt32>}
     */
    bytesread {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
