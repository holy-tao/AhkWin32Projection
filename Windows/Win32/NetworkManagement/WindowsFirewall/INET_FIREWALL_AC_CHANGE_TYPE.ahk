#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The INET_FIREWALL_AC_CHANGE_TYPE enumeration specifies which type of app container change occurred. (INET_FIREWALL_AC_CHANGE_TYPE)
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-inet_firewall_ac_change_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INET_FIREWALL_AC_CHANGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
