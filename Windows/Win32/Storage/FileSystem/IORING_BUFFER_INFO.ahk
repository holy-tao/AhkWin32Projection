#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a data buffer that can be registered with an I/O ring.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ns-ntioring_x-ioring_buffer_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_BUFFER_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A **VOID** pointer representing the address of the data buffer.
     * @type {Pointer<Void>}
     */
    Address {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The length of the data buffer, in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
