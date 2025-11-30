#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-storage-enum-mode
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDM_STORAGE_ENUM_MODE extends Win32Enum{

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
