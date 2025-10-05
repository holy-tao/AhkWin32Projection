#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_LAST_EVENT_INFO_BREAKPOINT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
