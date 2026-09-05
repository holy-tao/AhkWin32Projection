#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags controlling what is returned in the enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_callback_data_flags
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
class PRJ_CALLBACK_DATA_FLAGS extends Win32Enum {

    /**
     * Start the scan at the first entry in the directory.
     * Native name: PRJ_CB_DATA_FLAG_ENUM_RESTART_SCAN
     * @type {Integer (Int32)}
     */
    static CB_DATA_FLAG_ENUM_RESTART_SCAN => 1

    /**
     * Return only one entry from the enumeration.
     * Native name: PRJ_CB_DATA_FLAG_ENUM_RETURN_SINGLE_ENTRY
     * @type {Integer (Int32)}
     */
    static CB_DATA_FLAG_ENUM_RETURN_SINGLE_ENTRY => 2
}
