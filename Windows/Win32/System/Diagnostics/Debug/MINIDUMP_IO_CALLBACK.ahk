#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains I/O callback information.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_io_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_IO_CALLBACK extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The file handle passed to the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nf-minidumpapiset-minidumpwritedump">MiniDumpWriteDump</a> function.
     * @type {Pointer<Void>}
     */
    Handle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The offset for the write operation from the start of the minidump data. This member is used only with <b>IoWriteAllCallback</b>.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a buffer that contains the data to be written. This member is used only with <b>IoWriteAllCallback</b>.
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The size of the data buffer, in bytes. This member is used only with <b>IoWriteAllCallback</b>.
     * @type {Integer}
     */
    BufferBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
