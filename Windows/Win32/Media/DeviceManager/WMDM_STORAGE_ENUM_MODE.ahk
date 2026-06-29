#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMDM\_STORAGE\_ENUM\_MODE enumeration type defines how the content on the storage is to be enumerated. This enumeration is used by IWMDMStorage3 SetEnumPreference.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-storage-enum-mode
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDM_STORAGE_ENUM_MODE {
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
    static ENUM_MODE_RAW => 0

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_MODE_USE_DEVICE_PREF => 1

    /**
     * @type {Integer (Int32)}
     */
    static ENUM_MODE_METADATA_VIEWS => 2
}
