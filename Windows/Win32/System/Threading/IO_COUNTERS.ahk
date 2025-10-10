#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains I/O accounting information for a process or a job object.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-io_counters
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class IO_COUNTERS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The number of read operations performed.
     * @type {Integer}
     */
    ReadOperationCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of write operations performed.
     * @type {Integer}
     */
    WriteOperationCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of I/O operations performed, other than read and write operations.
     * @type {Integer}
     */
    OtherOperationCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of bytes read.
     * @type {Integer}
     */
    ReadTransferCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of bytes written.
     * @type {Integer}
     */
    WriteTransferCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of bytes transferred during operations other than read and write operations.
     * @type {Integer}
     */
    OtherTransferCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
