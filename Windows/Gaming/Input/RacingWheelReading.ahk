#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents the current state of the racing wheel.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheelreading
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class RacingWheelReading extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Time when the state was retrieved from the racing wheel.
     * @type {Integer}
     */
    Timestamp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The state of the racing wheel buttons.
     * @type {Integer}
     */
    Buttons {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The gear the pattern shifter is in.
     * @type {Integer}
     */
    PatternShifterGear {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The angle of the wheel.
     * @type {Float}
     */
    Wheel {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The position of the throttle.
     * @type {Float}
     */
    Throttle {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * The position of the brake.
     * @type {Float}
     */
    Brake {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * The position of the clutch.
     * @type {Float}
     */
    Clutch {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }

    /**
     * The position of the handbrake.
     * @type {Float}
     */
    Handbrake {
        get => NumGet(this, 48, "double")
        set => NumPut("double", value, this, 48)
    }
}
