#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a page added to a process working set.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-psapi_ws_watch_information
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class PSAPI_WS_WATCH_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to the instruction that caused the page fault.
     * @type {Pointer<Void>}
     */
    FaultingPc {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the page that was added to the working set.
     * @type {Pointer<Void>}
     */
    FaultingVa {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
