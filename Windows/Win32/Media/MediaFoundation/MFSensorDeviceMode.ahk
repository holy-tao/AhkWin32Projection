#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the sharing mode of an IMFSensorDevice.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsensordevicemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFSensorDeviceMode extends Win32Enum {

    /**
     * The device is in controller mode, which means its settings can be modified.
     * Native name: MFSensorDeviceMode_Controller
     * @type {Integer (Int32)}
     */
    static Controller => 0

    /**
     * The device is in shared mode, which means its settings can't be modified.
     * Native name: MFSensorDeviceMode_Shared
     * @type {Integer (Int32)}
     */
    static Shared => 1
}
