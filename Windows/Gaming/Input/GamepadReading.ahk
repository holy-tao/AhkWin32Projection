#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents the current state of the gamepad.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepadreading
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class GamepadReading extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Time when the state was retrieved from the gamepad.
     * @type {Integer}
     */
    Timestamp {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The state of the gamepad's buttons. This will be a combination of values in the [GamepadButtons](gamepadbuttons.md) enumeration.
     * @type {Integer}
     */
    Buttons {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The position of the left trigger. The value is between 0.0 (not depressed) and 1.0 (fully depressed).
     * @type {Float}
     */
    LeftTrigger {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The position of the right trigger. The value is between 0.0 (not depressed) and 1.0 (fully depressed).
     * @type {Float}
     */
    RightTrigger {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * The position of the left thumbstick on the X-axis. The value is between -1.0 and 1.0.
     * @type {Float}
     */
    LeftThumbstickX {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * The position of the left thumbstick on the Y-axis. The value is between -1.0 and 1.0.
     * @type {Float}
     */
    LeftThumbstickY {
        get => NumGet(this, 40, "double")
        set => NumPut("double", value, this, 40)
    }

    /**
     * The position of the right thumbstick on the X-axis. The value is between -1.0 and 1.0.
     * @type {Float}
     */
    RightThumbstickX {
        get => NumGet(this, 48, "double")
        set => NumPut("double", value, this, 48)
    }

    /**
     * The position of the right thumbstick on the Y-axis. The value is between -1.0 and 1.0.
     * @type {Float}
     */
    RightThumbstickY {
        get => NumGet(this, 56, "double")
        set => NumPut("double", value, this, 56)
    }
}
