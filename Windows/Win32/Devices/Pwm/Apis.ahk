#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class Pwm {

;@region Constants

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_PWM_CONTROLLER => Guid("{60824b4c-eed1-4c9c-b49c-1b961461a819}")

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_PWM_CONTROLLER_WSZ => "{60824B4C-EED1-4C9C-B49C-1B961461A819}"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_CONTROLLER_GET_INFO => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_CONTROLLER_GET_ACTUAL_PERIOD => 262148

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_CONTROLLER_SET_DESIRED_PERIOD => 294920

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE => 262544

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE => 295316

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_PIN_GET_POLARITY => 262552

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_PIN_SET_POLARITY => 295324

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_PIN_START => 295331

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_PIN_STOP => 295335

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_PWM_PIN_IS_STARTED => 262568

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_CONTROLLER_GET_INFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_CONTROLLER_GET_ACTUAL_PERIOD => 1

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_CONTROLLER_SET_DESIRED_PERIOD => 2

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE => 100

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE => 101

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_PIN_GET_POLARITY => 102

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_PIN_SET_POLARITY => 103

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_PIN_START => 104

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_PIN_STOP => 105

    /**
     * @type {Integer (Int32)}
     */
    static PWM_IOCTL_ID_PIN_IS_STARTED => 106
;@endregion Constants

;@region Methods
;@endregion Methods
}
