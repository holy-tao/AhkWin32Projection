#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains the current signal generation state of a pin.
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-pin-is-started-output
 * @namespace Windows.Win32.Devices.Pwm
 */
export default struct PWM_PIN_IS_STARTED_OUTPUT {
    #StructPack 1

    /**
     * The pin current signal generation state. A value of true means that the pin is started. A value of false means that the pin is stopped.
     */
    IsStarted : BOOLEAN

}
