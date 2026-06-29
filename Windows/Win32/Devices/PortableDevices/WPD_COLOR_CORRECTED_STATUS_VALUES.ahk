#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_COLOR\_CORRECTED\_STATUS\_VALUES enumeration type describes the color correction status of an image or video file.
 * @remarks
 * Indicates the color corrected status of an image. This enumeration is used by the [WPD\_IMAGE\_COLOR\_CORRECTED\_STATUS](image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-color-corrected-status-values
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_COLOR_CORRECTED_STATUS_VALUES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COLOR_CORRECTED_STATUS_NOT_CORRECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COLOR_CORRECTED_STATUS_CORRECTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COLOR_CORRECTED_STATUS_SHOULD_NOT_BE_CORRECTED => 2
}
