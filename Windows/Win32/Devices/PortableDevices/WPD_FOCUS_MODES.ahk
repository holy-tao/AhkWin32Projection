#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_FOCUS\_MODES enumeration type describes the focus mode used by a still image capture device.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_FOCUS\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-focus-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_FOCUS_MODES {
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
    static WPD_FOCUS_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FOCUS_MANUAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FOCUS_AUTOMATIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FOCUS_AUTOMATIC_MACRO => 3
}
