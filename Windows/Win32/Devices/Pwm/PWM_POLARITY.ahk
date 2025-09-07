#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the Pulse Width Modulation (PWM) signal level polarity with respect to the duty cycle.
 * @see https://learn.microsoft.com/windows/win32/api/pwm/ne-pwm-pwm_polarity
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_POLARITY{

    /**
     * Active High.
     * @type {Integer (Int32)}
     */
    static PWM_ACTIVE_HIGH => 0

    /**
     * Active Low.
     * @type {Integer (Int32)}
     */
    static PWM_ACTIVE_LOW => 1
}
