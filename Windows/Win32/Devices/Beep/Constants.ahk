#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Beep
 */

;@region Constants

/**
 * @type {String}
 */
export global DD_BEEP_DEVICE_NAME := "\Device\Beep"

/**
 * @type {String}
 */
export global DD_BEEP_DEVICE_NAME_U := "\Device\Beep"

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_BEEP_SET := 65536

/**
 * @type {Integer (UInt32)}
 */
export global BEEP_FREQUENCY_MINIMUM := 37

/**
 * @type {Integer (UInt32)}
 */
export global BEEP_FREQUENCY_MAXIMUM := 32767
;@endregion Constants
