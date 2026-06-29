#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_STORAGE\_TYPE\_VALUES enumeration type describes the different Windows Portable Device storage types.
 * @remarks
 * None.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-storage-type-values
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_STORAGE_TYPE_VALUES {
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
    static WPD_STORAGE_TYPE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_TYPE_FIXED_ROM => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_TYPE_REMOVABLE_ROM => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_TYPE_FIXED_RAM => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_STORAGE_TYPE_REMOVABLE_RAM => 4
}
