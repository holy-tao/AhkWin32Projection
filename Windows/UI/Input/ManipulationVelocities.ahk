#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\POINT.ahk

/**
 * Contains the velocities of the accumulated transformations for the current interaction.
  * 
  * > [!NOTE]
  * > Velocity is the distance an object travels in a specified direction during a unit of time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.manipulationvelocities
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationVelocities extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The straight line velocity in device-independent pixel (DIP) per millisecond.
     * @type {POINT}
     */
    Linear{
        get {
            if(!this.HasProp("__Linear"))
                this.__Linear := POINT(0, this)
            return this.__Linear
        }
    }

    /**
     * The rotational velocity in degrees per millisecond.
     * @type {Float}
     */
    Angular {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The expansion, or scaling, velocity in device-independent pixel (DIP) per millisecond.
     * @type {Float}
     */
    Expansion {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
