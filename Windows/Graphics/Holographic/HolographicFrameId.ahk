#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32Handle.ahk

/**
 * Uniquely identifies a [HolographicFrame](holographicframe.md) within its parent [HolographicSpace](holographicspace.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframeid
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFrameId extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * A 64-bit integer value uniquely identifying a **HolographicFrame**.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
