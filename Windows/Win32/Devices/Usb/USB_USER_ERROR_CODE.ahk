#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The USB_USER_ERROR_CODE enumeration lists the error codes that a USB user-mode request reports when it fails.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ne-usbuser-usb_user_error_code
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_USER_ERROR_CODE extends Win32Enum {

    /**
     * The user request succeeded.
     * Native name: UsbUserSuccess
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The user request was not supported.
     * Native name: UsbUserNotSupported
     * @type {Integer (Int32)}
     */
    static NotSupported => 1

    /**
     * The user request code was invalid.
     * Native name: UsbUserInvalidRequestCode
     * @type {Integer (Int32)}
     */
    static InvalidRequestCode => 2

    /**
     * The feature that was specified by user request is disabled.
     * Native name: UsbUserFeatureDisabled
     * @type {Integer (Int32)}
     */
    static FeatureDisabled => 3

    /**
     * The user request contains an invalid header parameter.
     * Native name: UsbUserInvalidHeaderParameter
     * @type {Integer (Int32)}
     */
    static InvalidHeaderParameter => 4

    /**
     * The user request contains an invalid parameter.
     * Native name: UsbUserInvalidParameter
     * @type {Integer (Int32)}
     */
    static InvalidParameter => 5

    /**
     * The user request failed because of a miniport driver error.
     * Native name: UsbUserMiniportError
     * @type {Integer (Int32)}
     */
    static MiniportError => 6

    /**
     * The user request failed because the data buffer was too small.
     * Native name: UsbUserBufferTooSmall
     * @type {Integer (Int32)}
     */
    static BufferTooSmall => 7

    /**
     * The USB stack could not map the error to one of the errors that are listed in this enumeration.
     * Native name: UsbUserErrorNotMapped
     * @type {Integer (Int32)}
     */
    static NotMapped => 8

    /**
     * The device was not started.
     * Native name: UsbUserDeviceNotStarted
     * @type {Integer (Int32)}
     */
    static DeviceNotStarted => 9

    /**
     * The device was not connected.
     * Native name: UsbUserNoDeviceConnected
     * @type {Integer (Int32)}
     */
    static NoDeviceConnected => 10
}
