#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a sensor device. A value from this enumeration is returned by IMFSensorDevice::GetDeviceType.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsensordevicetype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFSensorDeviceType extends Win32Enum {

    /**
     * The sensor device type is unknown.
     * Native name: MFSensorDeviceType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The sensor device is a physical device. Physical cameras may register as <a href="https://docs.microsoft.com/previous-versions/ff548567(v=vs.85)">KSCATEGORY_SENSOR_CAMERA</a> or <a href="https://docs.microsoft.com/previous-versions/ff548567(v=vs.85)">KSCATEGORY_VIDEO_CAMERA</a>  or both.
     * Native name: MFSensorDeviceType_Device
     * @type {Integer (Int32)}
     */
    static Device => 1

    /**
     * The sensor device is a custom media source.
     * Native name: MFSensorDeviceType_MediaSource
     * @type {Integer (Int32)}
     */
    static MediaSource => 2

    /**
     * The sensor device is a legacy frame provider.
     * Native name: MFSensorDeviceType_FrameProvider
     * @type {Integer (Int32)}
     */
    static FrameProvider => 3

    /**
     * Native name: MFSensorDeviceType_SensorTransform
     * @type {Integer (Int32)}
     */
    static SensorTransform => 4
}
