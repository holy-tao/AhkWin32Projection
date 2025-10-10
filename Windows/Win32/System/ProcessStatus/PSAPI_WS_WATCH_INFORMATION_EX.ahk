#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PSAPI_WS_WATCH_INFORMATION.ahk

/**
 * Contains extended information about a page added to a process working set.
 * @see https://docs.microsoft.com/windows/win32/api//psapi/ns-psapi-psapi_ws_watch_information_ex
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class PSAPI_WS_WATCH_INFORMATION_EX extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_ws_watch_information">PSAPI_WS_WATCH_INFORMATION</a> structure.
     * @type {PSAPI_WS_WATCH_INFORMATION}
     */
    BasicInfo{
        get {
            if(!this.HasProp("__BasicInfo"))
                this.__BasicInfo := PSAPI_WS_WATCH_INFORMATION(this.ptr + 0)
            return this.__BasicInfo
        }
    }

    /**
     * The identifier of the thread that caused the page fault.
     * @type {Pointer}
     */
    FaultingThreadId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * This member is reserved for future use.
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
