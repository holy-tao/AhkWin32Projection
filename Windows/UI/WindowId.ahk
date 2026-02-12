#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk
#Include ..\..\Win32Handle.ahk

/**
 * Defines an identifier for a top-level window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowid
 * @namespace Windows.UI
 * @version WindowsRuntime 1.4
 */
class WindowId extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * The identifier for a top-level window.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
