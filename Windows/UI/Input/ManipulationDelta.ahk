#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\POINT.ahk

/**
 * Contains the accumulated transformations for the current manipulation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationdelta
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationDelta extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The change in x-y screen coordinates, in device-independent pixel (DIP).
     * @type {POINT}
     */
    Translation{
        get {
            if(!this.HasProp("__Translation"))
                this.__Translation := POINT(0, this)
            return this.__Translation
        }
    }

    /**
     * The change in distance between touch contacts, as a percentage. For example, if the distance between two contacts changes from 100 device-independent pixel (DIP) to 200 device-independent pixel (DIP) during a manipulation, the value of **Scale** would be 2.0.
     * @type {Float}
     */
    Scale {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The change in angle of rotation, in degrees.
     * @type {Float}
     */
    Rotation {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The change in distance between touch contacts, as device-independent pixel (DIP). For example, if the distance between two contacts changes from 100 device-independent pixel (DIP) to 200 device-independent pixel (DIP) during a manipulation, the value of **Expansion** would be 100.0.
     * @type {Float}
     */
    Expansion {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }
}
