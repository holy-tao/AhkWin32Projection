#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the sharing mode of an IMFSensorDevice.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsensordevicemode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFSensorDeviceMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The device is in controller mode, which means its settings can be modified.
     * @type {Integer (Int32)}
     */
    static MFSensorDeviceMode_Controller => 0

    /**
     * The device is in shared mode, which means its settings can't be modified.
     * @type {Integer (Int32)}
     */
    static MFSensorDeviceMode_Shared => 1
}
