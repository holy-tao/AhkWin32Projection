#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags to specify the behavior when transferring a placeholder file or directory.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_operation_transfer_placeholders_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS{

    /**
     * No transfer placeholder flags.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_NONE => 0

    /**
     * Causes the API to return immediately if a placeholder transfer fails. If a transfer fails, the error code will be returned.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_STOP_ON_ERROR => 1

    /**
     * The transferred child placeholder directory is considered to have all of its children present locally.
 * 
 * Applicable to a child placeholder directory only.
     * @type {Integer (Int32)}
     */
    static CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAG_DISABLE_ON_DEMAND_POPULATION => 2
}
