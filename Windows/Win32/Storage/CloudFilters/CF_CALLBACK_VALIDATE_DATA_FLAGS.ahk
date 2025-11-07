#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags to validate the data of a placeholder file or directory.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_callback_validate_data_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_VALIDATE_DATA_FLAGS{

    /**
     * No data validation flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_VALIDATE_DATA_FLAG_NONE => 0

    /**
     * <b>Note</b>  This value is new for Windows 10, version 1803.
     * 
     * Set if the callback is invoked as a result of a call to <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfhydrateplaceholder">CfHydratePlaceholder</a>.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_VALIDATE_DATA_FLAG_EXPLICIT_HYDRATION => 2
}
