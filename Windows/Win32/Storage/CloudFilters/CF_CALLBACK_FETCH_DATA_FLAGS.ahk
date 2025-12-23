#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Callback flags for fetching data for a placeholder file or folder.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_fetch_data_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_FETCH_DATA_FLAGS extends Win32BitflagEnum{

    /**
     * No data fetch flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_FETCH_DATA_FLAG_NONE => 0

    /**
     * Flag to be used if the callback is invoked as a result of previously interrupted hydration process, due to either unexpected shutdown of the sync provider or power loss, etc.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_FETCH_DATA_FLAG_RECOVERY => 1

    /**
     * >[!NOTE]
     * >This value is new for Windows 10, version 1803.
     * 
     * Flag to be used if the callback is invoked as a result of a call to [CfHydratePlaceholder](nf-cfapi-cfhydrateplaceholder.md).
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_FETCH_DATA_FLAG_EXPLICIT_HYDRATION => 2
}
