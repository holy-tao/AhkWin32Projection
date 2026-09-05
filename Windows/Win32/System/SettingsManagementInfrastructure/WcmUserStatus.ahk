#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the status of the user.
 * @remarks
 * <b>UserUnloaded</b>, <b>UserUnregistered</b>, and <b>UnknownStatus</b> should not appear in typical use.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmuserstatus
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
class WcmUserStatus extends Win32Enum {

    /**
     * Indicates a problem with the store.
     * @type {Integer (Int32)}
     */
    static UnknownStatus => 0

    /**
     * Indicates that the store is registered, but is not currently loaded for use.
     * Native name: UserRegistered
     * @type {Integer (Int32)}
     */
    static Registered => 1

    /**
     * Indicates that the store does not currently exist.
     * Native name: UserUnregistered
     * @type {Integer (Int32)}
     */
    static Unregistered => 2

    /**
     * Indicates that the store is registered, loaded, and ready for use.
     * Native name: UserLoaded
     * @type {Integer (Int32)}
     */
    static Loaded => 3

    /**
     * This has the same semantics as <b>UserRegistered</b>.
     * Native name: UserUnloaded
     * @type {Integer (Int32)}
     */
    static Unloaded => 4
}
