#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Identifies the change in screen location of the mouse pointer, relative to the location of the last mouse event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mousedelta
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class MouseDelta extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The x-coordinate of the mouse pointer, relative to the location of the last mouse event.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The y-coordinate of the mouse pointer, relative to the location of the last mouse event.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
