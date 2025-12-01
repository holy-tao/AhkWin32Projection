#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes an entry from a list of the threads executing in the system when a snapshot was taken.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-threadentry32
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 * @version v4.0.30319
 */
class THREADENTRY32 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-thread32first">Thread32First</a> function, set this member to <c>sizeof(THREADENTRY32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Thread32First</b> fails.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member is no longer used and is always set to zero.
     * @type {Integer}
     */
    cntUsage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The thread identifier, compatible with the thread identifier returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function.
     * @type {Integer}
     */
    th32ThreadID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The identifier of the process that created the thread.
     * @type {Integer}
     */
    th32OwnerProcessID {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The kernel base priority level assigned to the thread. The priority is a number from 0 to 31, with 0 representing the lowest possible thread priority. For more information, see <b>KeQueryPriorityThread</b>.
     * @type {Integer}
     */
    tpBasePri {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * This member is no longer used and is always set to zero.
     * @type {Integer}
     */
    tpDeltaPri {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * This member is no longer used and is always set to zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
