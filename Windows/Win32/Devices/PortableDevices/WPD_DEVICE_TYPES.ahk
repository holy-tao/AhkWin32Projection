#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-device-types
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_DEVICE_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TYPE_GENERIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TYPE_CAMERA => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TYPE_MEDIA_PLAYER => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TYPE_PHONE => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TYPE_VIDEO => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TYPE_PERSONAL_INFORMATION_MANAGER => 5

    /**
     * @type {Integer (Int32)}
     */
    static WPD_DEVICE_TYPE_AUDIO_RECORDER => 6
}
