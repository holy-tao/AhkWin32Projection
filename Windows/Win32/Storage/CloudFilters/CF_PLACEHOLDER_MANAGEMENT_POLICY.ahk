#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_placeholder_management_policy
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLACEHOLDER_MANAGEMENT_POLICY{

    /**
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_MANAGEMENT_POLICY_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_MANAGEMENT_POLICY_CREATE_UNRESTRICTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_MANAGEMENT_POLICY_CONVERT_TO_UNRESTRICTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_MANAGEMENT_POLICY_UPDATE_UNRESTRICTED => 4
}
