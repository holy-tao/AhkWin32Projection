#Requires AutoHotkey v2.0.0 64-bit

/**
 * The property of the search criteria.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/ne-gpmgmt-gpmsearchproperty
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMSearchProperty{

    /**
     * The specified level of permission for a Group Policy Object.
     * @type {Integer (Int32)}
     */
    static gpoPermissions => 0

    /**
     * A specific set of permissions, whether the permissions are explicitly set or derived as a result of group membership.
     * @type {Integer (Int32)}
     */
    static gpoEffectivePermissions => 1

    /**
     * Display name of a Group Policy object.
     * @type {Integer (Int32)}
     */
    static gpoDisplayName => 2

    /**
     * Display name of a WMI filter.
     * @type {Integer (Int32)}
     */
    static gpoWMIFilter => 3

    /**
     * GUID of a Group Policy object.
     * @type {Integer (Int32)}
     */
    static gpoID => 4

    /**
     * Computer client-side extension
     * @type {Integer (Int32)}
     */
    static gpoComputerExtensions => 5

    /**
     * user client-side extension
     * @type {Integer (Int32)}
     */
    static gpoUserExtensions => 6

    /**
     * Scope of Management (SOM) that link to a Group Policy object.
     * @type {Integer (Int32)}
     */
    static somLinks => 7

    /**
     * domain name
     * @type {Integer (Int32)}
     */
    static gpoDomain => 8

    /**
     * The most recent backup
     * @type {Integer (Int32)}
     */
    static backupMostRecent => 9

    /**
     * The specified level of permission for a Starter Group Policy Object.
     * @type {Integer (Int32)}
     */
    static starterGPOPermissions => 10

    /**
     * A specific set of permissions, whether the permissions are explicitly set or derived as a result of group membership.
     * @type {Integer (Int32)}
     */
    static starterGPOEffectivePermissions => 11

    /**
     * Display name of a Starter Group Policy object.
     * @type {Integer (Int32)}
     */
    static starterGPODisplayName => 12

    /**
     * GUID of a Starter Group Policy object.
     * @type {Integer (Int32)}
     */
    static starterGPOID => 13

    /**
     * domain name
     * @type {Integer (Int32)}
     */
    static starterGPODomain => 14
}
