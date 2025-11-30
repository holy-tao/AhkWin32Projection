#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which type of app container change occurred.
 * @see https://docs.microsoft.com/windows/win32/api//networkisolation/ne-networkisolation-inet_firewall_ac_change_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INET_FIREWALL_AC_CHANGE_TYPE extends Win32Enum{

    /**
     * This value is reserved for system use.
     * @type {Integer (Int32)}
     */
    static INET_FIREWALL_AC_CHANGE_INVALID => 0

    /**
     * An app container was created.
     * @type {Integer (Int32)}
     */
    static INET_FIREWALL_AC_CHANGE_CREATE => 1

    /**
     * An app container was deleted.
     * @type {Integer (Int32)}
     */
    static INET_FIREWALL_AC_CHANGE_DELETE => 2

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static INET_FIREWALL_AC_CHANGE_MAX => 3
}
