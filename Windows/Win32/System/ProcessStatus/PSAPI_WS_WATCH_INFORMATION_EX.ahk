#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSAPI_WS_WATCH_INFORMATION.ahk" { PSAPI_WS_WATCH_INFORMATION }

/**
 * Contains extended information about a page added to a process working set.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-psapi_ws_watch_information_ex
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct PSAPI_WS_WATCH_INFORMATION_EX {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_ws_watch_information">PSAPI_WS_WATCH_INFORMATION</a> structure.
     */
    BasicInfo : PSAPI_WS_WATCH_INFORMATION

    /**
     * The identifier of the thread that caused the page fault.
     */
    FaultingThreadId : IntPtr

    /**
     * This member is reserved for future use.
     */
    Flags : IntPtr

}
