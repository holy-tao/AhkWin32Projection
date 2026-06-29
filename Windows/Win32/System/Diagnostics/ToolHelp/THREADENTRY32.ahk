#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes an entry from a list of the threads executing in the system when a snapshot was taken.
 * @see https://learn.microsoft.com/windows/win32/api/tlhelp32/ns-tlhelp32-threadentry32
 * @namespace Windows.Win32.System.Diagnostics.ToolHelp
 */
export default struct THREADENTRY32 {
    #StructPack 4

    /**
     * The size of the structure, in bytes. Before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tlhelp32/nf-tlhelp32-thread32first">Thread32First</a> function, set this member to <c>sizeof(THREADENTRY32)</c>. If you do not initialize <b>dwSize</b>, 
     * <b>Thread32First</b> fails.
     */
    dwSize : UInt32

    /**
     * This member is no longer used and is always set to zero.
     */
    cntUsage : UInt32

    /**
     * The thread identifier, compatible with the thread identifier returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function.
     */
    th32ThreadID : UInt32

    /**
     * The identifier of the process that created the thread.
     */
    th32OwnerProcessID : UInt32

    /**
     * The kernel base priority level assigned to the thread. The priority is a number from 0 to 31, with 0 representing the lowest possible thread priority. For more information, see <b>KeQueryPriorityThread</b>.
     */
    tpBasePri : Int32

    /**
     * This member is no longer used and is always set to zero.
     */
    tpDeltaPri : Int32

    /**
     * This member is no longer used and is always set to zero.
     */
    dwFlags : UInt32

}
