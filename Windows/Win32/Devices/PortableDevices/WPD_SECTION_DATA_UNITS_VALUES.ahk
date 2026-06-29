#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_SECTION\_DATA\_UNITS\_VALUES enumeration indicates the units for a referenced section of data.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-section-data-units-values
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_SECTION_DATA_UNITS_VALUES {
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
    static WPD_SECTION_DATA_UNITS_BYTES => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_SECTION_DATA_UNITS_MILLISECONDS => 1
}
