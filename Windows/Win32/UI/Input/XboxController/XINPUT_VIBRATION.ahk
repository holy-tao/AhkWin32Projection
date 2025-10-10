#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies motor speed levels for the vibration function of a controller.
 * @remarks
 * 
  * The left motor is the low-frequency rumble motor. The right motor is the high-frequency rumble motor. The two motors are not the same, and they create different vibration effects.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xinput/ns-xinput-xinput_vibration
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_VIBRATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Speed of the left motor. Valid values are in the range 0 to 65,535. Zero signifies no motor use; 65,535 signifies 100 percent motor use.
     * @type {Integer}
     */
    wLeftMotorSpeed {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Speed of the right motor. Valid values are in the range 0 to 65,535. Zero signifies no motor use; 65,535 signifies 100 percent motor use.
     * @type {Integer}
     */
    wRightMotorSpeed {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
