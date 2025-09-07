#Requires AutoHotkey v2.0.0 64-bit

/**
 * The INET_FIREWALL_AC_CREATION_TYPE enumeration specifies the type of app container creation events for which notifications will be delivered.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-inet_firewall_ac_creation_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INET_FIREWALL_AC_CREATION_TYPE{

    /**
     * This value is reserved for system use.
     * @type {Integer (Int32)}
     */
    static INET_FIREWALL_AC_NONE => 0

    /**
     * Notifications will be delivered when an app container is created with a package identifier.
     * @type {Integer (Int32)}
     */
    static INET_FIREWALL_AC_PACKAGE_ID_ONLY => 1

    /**
     * Notifications will be delivered when an app container is created with a binary path.
     * @type {Integer (Int32)}
     */
    static INET_FIREWALL_AC_BINARY => 2

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static INET_FIREWALL_AC_MAX => 4
}
