#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The USB_USER_ERROR_CODE enumeration lists the error codes that a USB user-mode request reports when it fails.
 * @see https://docs.microsoft.com/windows/win32/api//usbuser/ne-usbuser-usb_user_error_code
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_USER_ERROR_CODE extends Win32Enum{

    /**
     * The user request succeeded.
     * @type {Integer (Int32)}
     */
    static UsbUserSuccess => 0

    /**
     * The user request was not supported.
     * @type {Integer (Int32)}
     */
    static UsbUserNotSupported => 1

    /**
     * The user request code was invalid.
     * @type {Integer (Int32)}
     */
    static UsbUserInvalidRequestCode => 2

    /**
     * The feature that was specified by user request is disabled.
     * @type {Integer (Int32)}
     */
    static UsbUserFeatureDisabled => 3

    /**
     * The user request contains an invalid header parameter.
     * @type {Integer (Int32)}
     */
    static UsbUserInvalidHeaderParameter => 4

    /**
     * The user request contains an invalid parameter.
     * @type {Integer (Int32)}
     */
    static UsbUserInvalidParameter => 5

    /**
     * The user request failed because of a miniport driver error.
     * @type {Integer (Int32)}
     */
    static UsbUserMiniportError => 6

    /**
     * The user request failed because the data buffer was too small.
     * @type {Integer (Int32)}
     */
    static UsbUserBufferTooSmall => 7

    /**
     * The USB stack could not map the error to one of the errors that are listed in this enumeration.
     * @type {Integer (Int32)}
     */
    static UsbUserErrorNotMapped => 8

    /**
     * The device was not started.
     * @type {Integer (Int32)}
     */
    static UsbUserDeviceNotStarted => 9

    /**
     * The device was not connected.
     * @type {Integer (Int32)}
     */
    static UsbUserNoDeviceConnected => 10
}
