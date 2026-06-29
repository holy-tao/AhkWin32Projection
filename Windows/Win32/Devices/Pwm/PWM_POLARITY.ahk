#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the Pulse Width Modulation (PWM) signal level polarity with respect to the duty cycle.
 * @see https://learn.microsoft.com/windows/win32/api/pwm/ne-pwm-pwm_polarity
 * @namespace Windows.Win32.Devices.Pwm
 */
export default struct PWM_POLARITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
