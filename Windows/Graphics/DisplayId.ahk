#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk
#Include ..\..\Win32Handle.ahk

/**
 * Represents the identifier of a logical display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.displayid
 * @namespace Windows.Graphics
 * @version WindowsRuntime 1.4
 */
class DisplayId extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * The identifier of a logical display.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
