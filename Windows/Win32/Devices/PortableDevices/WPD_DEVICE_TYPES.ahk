#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_DEVICE\_TYPES enumeration type describes the different Windows Portable Device (WPD) types commonly used to determine the basic classification and visual appearance of a portable device.
 * @remarks
 * **WPD\_DEVICE\_TYPES** are read using the [**IPortableDeviceManager**](/windows/desktop/api/PortableDeviceApi/nn-portabledeviceapi-iportabledevicemanager) interface. WPD applications may use these values to determine the generic visual appearance of the device. That is, a camera picture is displayed for camera-like devices, a mobile phone picture is displayed for phone-like devices, and so on.
 * 
 * > [!Note]  
 * > WPD applications must use the capabilities of the portable device to determine functionally, not the **WPD\_DEVICE\_TYPES** value.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-device-types
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_DEVICE_TYPES extends Win32Enum{

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
