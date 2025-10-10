#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains a variety of information.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ns-minidumpapiset-minidump_misc_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MISC_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    SizeOfInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The identifier of the process. If <b>Flags1</b> does not specify MINIDUMP_MISC1_PROCESS_ID, this member is unused.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The creation time of the process, in <b>time_t</b> format. If <b>Flags1</b> does not specify MINIDUMP_MISC1_PROCESS_TIMES, this member is unused.
     * @type {Integer}
     */
    ProcessCreateTime {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The time the process has executed in user mode, in seconds. The time that each of the threads of the process has executed in user mode is determined, then all these times are summed to obtain this value. If <b>Flags1</b> does not specify MINIDUMP_MISC1_PROCESS_TIMES, this member is unused.
     * @type {Integer}
     */
    ProcessUserTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The time the process has executed in kernel mode, in seconds. The time that each of the threads of the process has executed in kernel mode is determined, then all these times are summed to obtain this value. If <b>Flags1</b> does not specify MINIDUMP_MISC1_PROCESS_TIMES, this member is unused.
     * @type {Integer}
     */
    ProcessKernelTime {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
