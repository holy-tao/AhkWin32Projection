#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Corresponds to the LUID (Locally Unique Identifier) associated with a graphics adapter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.displayadapterid
 * @namespace Windows.Graphics
 * @version WindowsRuntime 1.4
 */
class DisplayAdapterId extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The low part of the LUID.
     * @type {Integer}
     */
    LowPart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The high part of the LUID.
     * @type {Integer}
     */
    HighPart {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
