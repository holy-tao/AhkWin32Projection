#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a page added to a process working set.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-psapi_ws_watch_information
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct PSAPI_WS_WATCH_INFORMATION {
    #StructPack 8

    /**
     * A pointer to the instruction that caused the page fault.
     */
    FaultingPc : IntPtr

    /**
     * A pointer to the page that was added to the working set.
     */
    FaultingVa : IntPtr

}
