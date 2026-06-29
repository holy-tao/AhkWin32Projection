#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies motor speed levels for the vibration function of a controller.
 * @remarks
 * The left motor is the low-frequency rumble motor. The right motor is the high-frequency rumble motor. The two motors are not the same, and they create different vibration effects.
 * @see https://learn.microsoft.com/windows/win32/api/xinput/ns-xinput-xinput_vibration
 * @namespace Windows.Win32.UI.Input.XboxController
 */
export default struct XINPUT_VIBRATION {
    #StructPack 2

    /**
     * Speed of the left motor. Valid values are in the range 0 to 65,535. Zero signifies no motor use; 65,535 signifies 100 percent motor use.
     */
    wLeftMotorSpeed : UInt16

    /**
     * Speed of the right motor. Valid values are in the range 0 to 65,535. Zero signifies no motor use; 65,535 signifies 100 percent motor use.
     */
    wRightMotorSpeed : UInt16

}
