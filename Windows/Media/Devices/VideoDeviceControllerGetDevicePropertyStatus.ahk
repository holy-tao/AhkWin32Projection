#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status of an operation to get the value of a video device controller driver property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontrollergetdevicepropertystatus
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class VideoDeviceControllerGetDevicePropertyStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * @type {Integer (Int32)}
     */
    static BufferTooSmall => 2

    /**
     * @type {Integer (Int32)}
     */
    static NotSupported => 3

    /**
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaxPropertyValueSizeTooSmall => 5

    /**
     * @type {Integer (Int32)}
     */
    static MaxPropertyValueSizeRequired => 6
}
