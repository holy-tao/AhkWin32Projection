#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes which polarity the PWM signal should start in.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pwm.pwmpulsepolarity
 * @namespace Windows.Devices.Pwm
 * @version WindowsRuntime 1.4
 */
class PwmPulsePolarity extends Win32Enum{

    /**
     * Configures the PWM signal to start in the active high state.
     * @type {Integer (Int32)}
     */
    static ActiveHigh => 0

    /**
     * Configures the PWM signal to start in the active low state.
     * @type {Integer (Int32)}
     */
    static ActiveLow => 1
}
