#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_device_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_DEVICE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Hardware device. Video processing is performed in the GPU by the driver.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_TYPE_HARDWARE => 0

    /**
     * Software device. Video processing is performed in the CPU by a software plug-in.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_TYPE_SOFTWARE => 1

    /**
     * Reference device. Video processing is performed in the CPU by a software plug-in.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_TYPE_REFERENCE => 2

    /**
     * Other. The device is neither a hardware device nor a software plug-in.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_TYPE_OTHER => 3
}
