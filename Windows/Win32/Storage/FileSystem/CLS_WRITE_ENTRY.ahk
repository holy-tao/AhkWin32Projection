#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a user buffer, which is to become part of a log record, and its length.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_write_entry
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_WRITE_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The log record data buffer.
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The length of the log record data buffer, in bytes.
     * @type {Integer}
     */
    ByteLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
