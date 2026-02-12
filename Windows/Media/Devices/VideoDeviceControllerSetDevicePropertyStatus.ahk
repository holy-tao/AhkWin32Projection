#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status of an operation to set the value of a video device controller driver property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videodevicecontrollersetdevicepropertystatus
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class VideoDeviceControllerSetDevicePropertyStatus extends Win32Enum{

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
    static NotSupported => 2

    /**
     * @type {Integer (Int32)}
     */
    static InvalidValue => 3

    /**
     * @type {Integer (Int32)}
     */
    static DeviceNotAvailable => 4

    /**
     * @type {Integer (Int32)}
     */
    static NotInControl => 5
}
