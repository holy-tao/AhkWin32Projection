#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The current state of the flight stick.
 * @remarks
 * For information about how to process the information provided in this structure, see [Flight stick](/windows/uwp/gaming/flight-stick).
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstickreading
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class FlightStickReading extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The time that the reading was reported from the hardware.
     * @type {Integer}
     */
    Timestamp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The button currently being pressed.
     * @type {Integer}
     */
    Buttons {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The position of the hat switch.
     * @type {Integer}
     */
    HatSwitch {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The amount of roll (rotation around the Z-axis; left and right movement on the flight stick).
     * @type {Float}
     */
    Roll {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The amount of pitch (rotation around the X-axis; forward and backward movement on the flight stick).
     * @type {Float}
     */
    Pitch {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * The amount of yaw (rotation around the Y-axis; usually read from twisting the joystick or from some other input).
     * @type {Float}
     */
    Yaw {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * The position of the throttle.
     * @type {Float}
     */
    Throttle {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }
}
