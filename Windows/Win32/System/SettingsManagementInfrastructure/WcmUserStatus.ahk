#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the status of the user.
 * @remarks
 * 
  * <b>UserUnloaded</b>, <b>UserUnregistered</b>, and <b>UnknownStatus</b> should not appear in typical use.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/ne-wcmconfig-wcmuserstatus
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class WcmUserStatus{

    /**
     * Indicates a problem with the store.
     * @type {Integer (Int32)}
     */
    static UnknownStatus => 0

    /**
     * Indicates that the store is registered, but is not currently loaded for use.
     * @type {Integer (Int32)}
     */
    static UserRegistered => 1

    /**
     * Indicates that the store does not currently exist.
     * @type {Integer (Int32)}
     */
    static UserUnregistered => 2

    /**
     * Indicates that the store is registered, loaded, and ready for use.
     * @type {Integer (Int32)}
     */
    static UserLoaded => 3

    /**
     * This has the same semantics as <b>UserRegistered</b>.
     * @type {Integer (Int32)}
     */
    static UserUnloaded => 4
}
