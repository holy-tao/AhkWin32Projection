#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_CROPPED\_STATUS\_VALUES enumeration type describes the cropping status of an image.
 * @remarks
 * Indicates the cropped status of an image. This enumeration is used by the [WPD\_IMAGE\_CROPPED\_STATUS](image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-cropped-status-values
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_CROPPED_STATUS_VALUES {
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
    static WPD_CROPPED_STATUS_NOT_CROPPED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CROPPED_STATUS_CROPPED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CROPPED_STATUS_SHOULD_NOT_BE_CROPPED => 2
}
