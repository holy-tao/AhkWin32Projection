#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_POWER\_SOURCES enumeration type describes the power source that a device is using.
 * @remarks
 * This enumeration is used by the [WPD\_DEVICE\_POWER\_SOURCE](device-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-power-sources
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_POWER_SOURCES {
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
    static WPD_POWER_SOURCE_BATTERY => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_POWER_SOURCE_EXTERNAL => 1
}
