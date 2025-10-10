#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_EXTENDED_ITEM_STACK_KEY32 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MatchId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    StackKey {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Padding {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
