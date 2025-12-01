#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags controlling what is returned in the enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_callback_data_flags
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_CALLBACK_DATA_FLAGS extends Win32Enum{

    /**
     * Start the scan at the first entry in the directory.
     * @type {Integer (Int32)}
     */
    static PRJ_CB_DATA_FLAG_ENUM_RESTART_SCAN => 1

    /**
     * Return only one entry from the enumeration.
     * @type {Integer (Int32)}
     */
    static PRJ_CB_DATA_FLAG_ENUM_RETURN_SINGLE_ENTRY => 2
}
