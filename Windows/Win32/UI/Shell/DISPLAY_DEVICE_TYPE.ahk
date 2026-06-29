#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether the device is a primary or immersive type of display.
 * @see https://learn.microsoft.com/windows/win32/api/shellscalingapi/ne-shellscalingapi-display_device_type
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DISPLAY_DEVICE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The device is a primary display device.
     * @type {Integer (Int32)}
     */
    static DEVICE_PRIMARY => 0

    /**
     * The device is an immersive display device.
     * @type {Integer (Int32)}
     */
    static DEVICE_IMMERSIVE => 1
}
