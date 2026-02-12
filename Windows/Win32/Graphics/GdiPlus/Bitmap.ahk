#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * Bitmap Warning Event Class
 * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/event-classes/bitmap-warning-event-class
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Bitmap extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
