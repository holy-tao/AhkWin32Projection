#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a failed memory read operation.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_read_memory_failure_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_READ_MEMORY_FAILURE_CALLBACK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The offset of the address for the failed memory read operation.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the failed memory read operation, in bytes.
     * @type {Integer}
     */
    Bytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The resulting error code from the failed memory read operation.
     * @type {HRESULT}
     */
    FailureStatus {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
