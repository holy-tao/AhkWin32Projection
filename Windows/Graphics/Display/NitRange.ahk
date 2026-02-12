#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes the minimum, maximum, and step size you can use when using nits to describe brightness on a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.nitrange
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class NitRange extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The inclusive end point.
     * @type {Float}
     */
    MinNits {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The inclusive start point.
     * @type {Float}
     */
    MaxNits {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The step size, in nits, of the display brightness. Guaranteed to be a factor of (MinNits - MaxNits).
     * @type {Float}
     */
    StepSizeNits {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
