#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the sharing mode of an IMFSensorDevice.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfsensordevicemode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSensorDeviceMode extends Win32Enum{

    /**
     * The device is in controller mode, which means its settings can be modified.
     * @type {Integer (Int32)}
     */
    static MFSensorDeviceMode_Controller => 0

    /**
     * The device is in shared mode, which means it's settings can't be modified.
     * @type {Integer (Int32)}
     */
    static MFSensorDeviceMode_Shared => 1
}
