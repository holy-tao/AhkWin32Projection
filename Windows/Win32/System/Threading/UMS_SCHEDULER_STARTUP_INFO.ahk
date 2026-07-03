#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies attributes for a user-mode scheduling (UMS) scheduler thread.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-ums_scheduler_startup_info
 * @namespace Windows.Win32.System.Threading
 */
export default struct UMS_SCHEDULER_STARTUP_INFO {
    #StructPack 8

    /**
     * The UMS version for which the application was built. This parameter must be <b>UMS_VERSION</b>.
     */
    UmsVersion : UInt32

    /**
     * A pointer to a UMS completion list to associate with the calling thread.
     */
    CompletionList : IntPtr

    /**
     * A pointer to an application-defined <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-rtl_ums_scheduler_entry_point">UmsSchedulerProc</a> entry point function. The system calls this function when the calling thread has been converted to UMS and is ready to run UMS worker threads. Subsequently, it calls this function when a UMS worker thread running on the calling thread yields or blocks.
     */
    SchedulerProc : IntPtr

    /**
     * An application-defined parameter to pass to the specified <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-rtl_ums_scheduler_entry_point">UmsSchedulerProc</a> function.
     */
    SchedulerParam : IntPtr

}
