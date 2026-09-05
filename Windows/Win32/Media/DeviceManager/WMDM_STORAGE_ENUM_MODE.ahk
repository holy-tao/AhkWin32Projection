#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMDM\_STORAGE\_ENUM\_MODE enumeration type defines how the content on the storage is to be enumerated. This enumeration is used by IWMDMStorage3 SetEnumPreference.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-storage-enum-mode
 * @namespace Windows.Win32.Media.DeviceManager
 */
class WMDM_STORAGE_ENUM_MODE extends Win32Enum {

    /**
     * Native name: ENUM_MODE_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 0

    /**
     * Native name: ENUM_MODE_USE_DEVICE_PREF
     * @type {Integer (Int32)}
     */
    static USE_DEVICE_PREF => 1

    /**
     * Native name: ENUM_MODE_METADATA_VIEWS
     * @type {Integer (Int32)}
     */
    static METADATA_VIEWS => 2
}
