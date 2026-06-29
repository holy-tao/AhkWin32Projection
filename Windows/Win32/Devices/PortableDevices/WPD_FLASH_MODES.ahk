#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_FLASH\_MODES enumeration type describes a flash mode to use when capturing images with a device.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_FLASH\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-flash-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_FLASH_MODES {
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
    static WPD_FLASH_MODE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_AUTO => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_OFF => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_FILL => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_RED_EYE_AUTO => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_RED_EYE_FILL => 5

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FLASH_MODE_EXTERNAL_SYNC => 6
}
