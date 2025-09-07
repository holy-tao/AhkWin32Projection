#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a UMS scheduler thread, UMS worker thread, or non-UMS thread. The GetUmsSystemThreadInformation function uses this structure.
 * @remarks
 * If both <b>IsUmsSchedulerThread</b>  and <b>IsUmsWorkerThread</b> are clear, the structure specifies a non-UMS thread.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-ums_system_thread_information
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class UMS_SYSTEM_THREAD_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The UMS version. This member must be UMS_VERSION.
     * @type {Integer}
     */
    UmsVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ThreadUmsFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
