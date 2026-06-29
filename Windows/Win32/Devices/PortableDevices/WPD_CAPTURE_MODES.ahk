#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_CAPTURE\_MODES enumeration type describes the capture timing mode of a still image capture.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_CAPTURE\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-capture-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_CAPTURE_MODES {
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
    static WPD_CAPTURE_MODE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CAPTURE_MODE_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CAPTURE_MODE_BURST => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CAPTURE_MODE_TIMELAPSE => 3
}
