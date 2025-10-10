#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains thread state information.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_thread_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_THREAD_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The identifier of the thread.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    DumpFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An <b>HRESULT</b> value that indicates the dump status.
     * @type {Integer}
     */
    DumpError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The thread termination status code.
     * @type {Integer}
     */
    ExitStatus {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The time when the thread was created, in 100-nanosecond intervals since January 1, 1601 (UTC).
     * @type {Integer}
     */
    CreateTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The time when the thread exited, in 100-nanosecond intervals since January 1, 1601 (UTC).
     * @type {Integer}
     */
    ExitTime {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The time executed in kernel mode, in 100-nanosecond intervals.
     * @type {Integer}
     */
    KernelTime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The time executed in user mode, in 100-nanosecond intervals.
     * @type {Integer}
     */
    UserTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The starting address of the thread.
     * @type {Integer}
     */
    StartAddress {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The processor affinity mask.
     * @type {Integer}
     */
    Affinity {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
