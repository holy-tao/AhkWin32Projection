#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a sensor device. A value from this enumeration is returned by IMFSensorDevice::GetDeviceType.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsensordevicetype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSensorDeviceType extends Win32Enum{

    /**
     * The sensor device type is unknown.
     * @type {Integer (Int32)}
     */
    static MFSensorDeviceType_Unknown => 0

    /**
     * The sensor device is a physical device. Physical cameras may register as <a href="https://docs.microsoft.com/previous-versions/ff548567(v=vs.85)">KSCATEGORY_SENSOR_CAMERA</a> or <a href="https://docs.microsoft.com/previous-versions/ff548567(v=vs.85)">KSCATEGORY_VIDEO_CAMERA</a>  or both.
     * @type {Integer (Int32)}
     */
    static MFSensorDeviceType_Device => 1

    /**
     * The sensor device is a custom media source.
     * @type {Integer (Int32)}
     */
    static MFSensorDeviceType_MediaSource => 2

    /**
     * The sensor device is a legacy frame provider.
     * @type {Integer (Int32)}
     */
    static MFSensorDeviceType_FrameProvider => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MFSensorDeviceType_SensorTransform => 4
}
