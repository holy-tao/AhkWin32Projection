#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents the graphics adapter used for rendering holographic content. Matches the Win32 locally unique identifier (LUID) type.
 * @remarks
 * Matches the Win32 locally unique identifier (LUID) type.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicadapterid
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicAdapterId extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The LowPart of the LUID struct.
     * @type {Integer}
     */
    LowPart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The HighPart of the LUID struct.
     * @type {Integer}
     */
    HighPart {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
