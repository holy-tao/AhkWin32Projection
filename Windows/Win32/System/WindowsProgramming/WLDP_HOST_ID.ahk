#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the host type of the WLDP caller.
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_host_id
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WLDP_HOST_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The host type is unknown.
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_ID_UNKNOWN => 0

    /**
     * The host type is global policy.
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_ID_GLOBAL => 1

    /**
     * The host type is VBScript.
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_ID_VBA => 2

    /**
     * The host type is Windows Script Host.
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_ID_WSH => 3

    /**
     * The host type is Windows Powershell.
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_ID_POWERSHELL => 4

    /**
     * The host type is Internet Explorer.
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_ID_IE => 5

    /**
     * The host type is the Microsoft Windows Installer.
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_ID_MSI => 6

    /**
     * Catch-all for custom objects without a subject interface package.
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_ID_ALL => 7

    /**
     * The maximum enumeration value.
     * @type {Integer (Int32)}
     */
    static WLDP_HOST_ID_MAX => 8
}
