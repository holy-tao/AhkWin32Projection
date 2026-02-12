#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * Represents the amount of time since the system was last started, in 100ns intervals.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/presentationtypes/ns-presentationtypes-systeminterrupttime
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class SystemInterruptTime extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * 
     * The amount of time since the system was last started, in 100ns intervals.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
