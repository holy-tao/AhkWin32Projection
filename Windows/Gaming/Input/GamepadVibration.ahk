#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes the speed of the gamepad's four available vibration motors.
 * @remarks
 * Note that on devices with fewer motors, four vibration motor speed values are combined by the driver in a way that gives the best possible approximation of the haptic feedback you'd get on a controller that has all four motors.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepadvibration
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class GamepadVibration extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The level of the left vibration motor. Valid values are between 0.0 and 1.0, where 0.0 signifies no motor use and 1.0 signifies max vibration.
     * @type {Float}
     */
    LeftMotor {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The level of the right vibration motor. Valid values are between 0.0 and 1.0, where 0.0 signifies no motor use and 1.0 signifies max vibration.
     * @type {Float}
     */
    RightMotor {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The left trigger vibration level. Valid values are between 0.0 and 1.0, where 0.0 signifies no motor use and 1.0 signifies max vibration.
     * @type {Float}
     */
    LeftTrigger {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The right trigger vibration level. Valid values are between 0.0 and 1.0, where 0.0 signifies no motor use and 1.0 signifies max vibration.
     * @type {Float}
     */
    RightTrigger {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }
}
