#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a placeholder management policy for a CF_SYNC_POLICIES structure.
 * @remarks
 * By default, only a sync provider can perform placeholder management operations in a sync root. Non sync provider processes can perform placeholder management operations only if the sync root is inactive, i.e., when the sync root is not connected to by any sync provider. These policies, when enabled, allow non sync provider processes to perform respective placeholder management operations in an active sync root. The default policy allowing only a connected sync provider to perform any placeholder management operations. The three other policies can be specified in any combination.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_placeholder_management_policy
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLACEHOLDER_MANAGEMENT_POLICY extends Win32Enum{

    /**
     * Only a sync provider can perform placeholder management operations in a sync roo
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_MANAGEMENT_POLICY_DEFAULT => 0

    /**
     * Any process can create a placeholder within an active sync root.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_MANAGEMENT_POLICY_CREATE_UNRESTRICTED => 1

    /**
     * Any process can convert a file within an active sync root to a placeholder.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_MANAGEMENT_POLICY_CONVERT_TO_UNRESTRICTED => 2

    /**
     * Any process can update a placeholder within an active sync root.
     * @type {Integer (Int32)}
     */
    static CF_PLACEHOLDER_MANAGEMENT_POLICY_UPDATE_UNRESTRICTED => 4
}
