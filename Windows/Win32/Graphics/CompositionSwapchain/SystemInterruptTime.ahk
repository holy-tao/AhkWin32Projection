#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the amount of time since the system was last started, in 100ns intervals.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentationtypes/ns-presentationtypes-systeminterrupttime
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class SystemInterruptTime extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

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
