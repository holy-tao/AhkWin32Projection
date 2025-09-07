#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMDM\_STORAGE\_ENUM\_MODE enumeration type defines how the content on the storage is to be enumerated. This enumeration is used by IWMDMStorage3 SetEnumPreference.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-storage-enum-mode
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_STORAGE_ENUM_MODE{

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
