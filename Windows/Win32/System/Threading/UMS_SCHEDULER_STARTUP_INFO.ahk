#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies attributes for a user-mode scheduling (UMS) scheduler thread.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-ums_scheduler_startup_info
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class UMS_SCHEDULER_STARTUP_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The UMS version for which the application was built. This parameter must be <b>UMS_VERSION</b>.
     * @type {Integer}
     */
    UmsVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a UMS completion list to associate with the calling thread.
     * @type {Pointer<Void>}
     */
    CompletionList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to an application-defined <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-rtl_ums_scheduler_entry_point">UmsSchedulerProc</a> entry point function. The system calls this function when the calling thread has been converted to UMS and is ready to run UMS worker threads. Subsequently, it calls this function when a UMS worker thread running on the calling thread yields or blocks.
     * @type {Pointer<PRTL_UMS_SCHEDULER_ENTRY_POINT>}
     */
    SchedulerProc {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * An application-defined parameter to pass to the specified <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nc-winnt-rtl_ums_scheduler_entry_point">UmsSchedulerProc</a> function.
     * @type {Pointer<Void>}
     */
    SchedulerParam {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
