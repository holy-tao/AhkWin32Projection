#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Devices.Beep
 * @version v4.0.30319
 */
class Beep {

;@region Constants

    /**
     * @type {String}
     */
    static DD_BEEP_DEVICE_NAME => "\Device\Beep"

    /**
     * @type {String}
     */
    static DD_BEEP_DEVICE_NAME_U => "\Device\Beep"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_BEEP_SET => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static BEEP_FREQUENCY_MINIMUM => 37

    /**
     * @type {Integer (UInt32)}
     */
    static BEEP_FREQUENCY_MAXIMUM => 32767
;@endregion Constants

;@region Methods
;@endregion Methods
}
