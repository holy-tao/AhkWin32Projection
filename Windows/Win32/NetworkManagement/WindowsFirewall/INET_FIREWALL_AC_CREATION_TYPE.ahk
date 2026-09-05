#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The INET_FIREWALL_AC_CREATION_TYPE enumeration specifies the type of app container creation events for which notifications will be delivered.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-inet_firewall_ac_creation_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class INET_FIREWALL_AC_CREATION_TYPE extends Win32Enum {

    /**
     * This value is reserved for system use.
     * Native name: INET_FIREWALL_AC_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Notifications will be delivered when an app container is created with a package identifier.
     * Native name: INET_FIREWALL_AC_PACKAGE_ID_ONLY
     * @type {Integer (Int32)}
     */
    static PACKAGE_ID_ONLY => 1

    /**
     * Notifications will be delivered when an app container is created with a binary path.
     * Native name: INET_FIREWALL_AC_BINARY
     * @type {Integer (Int32)}
     */
    static BINARY => 2

    /**
     * Maximum value for testing purposes.
     * Native name: INET_FIREWALL_AC_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 4
}
