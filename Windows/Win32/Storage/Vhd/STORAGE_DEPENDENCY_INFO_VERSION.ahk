#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains the version of the virtual hard disk (VHD) STORAGE_DEPENDENCY_INFO structure to use in calls to VHD functions.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-storage_dependency_info_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class STORAGE_DEPENDENCY_INFO_VERSION{

    /**
     * The version is not specified.
     * @type {Integer (Int32)}
     */
    static STORAGE_DEPENDENCY_INFO_VERSION_UNSPECIFIED => 0

    /**
     * Specifies <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-storage_dependency_info_type_1">STORAGE_DEPENDENCY_INFO_TYPE_1</a>.
     * @type {Integer (Int32)}
     */
    static STORAGE_DEPENDENCY_INFO_VERSION_1 => 1

    /**
     * Specifies <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-storage_dependency_info_type_2">STORAGE_DEPENDENCY_INFO_TYPE_2</a>.
     * @type {Integer (Int32)}
     */
    static STORAGE_DEPENDENCY_INFO_VERSION_2 => 2
}
