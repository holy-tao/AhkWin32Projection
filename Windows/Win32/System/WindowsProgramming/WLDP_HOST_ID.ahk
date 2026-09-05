#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the host type of the WLDP caller.
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_host_id
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class WLDP_HOST_ID extends Win32Enum {

    /**
     * The host type is unknown.
     * Native name: WLDP_HOST_ID_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The host type is global policy.
     * Native name: WLDP_HOST_ID_GLOBAL
     * @type {Integer (Int32)}
     */
    static GLOBAL => 1

    /**
     * The host type is VBScript.
     * Native name: WLDP_HOST_ID_VBA
     * @type {Integer (Int32)}
     */
    static VBA => 2

    /**
     * The host type is Windows Script Host.
     * Native name: WLDP_HOST_ID_WSH
     * @type {Integer (Int32)}
     */
    static WSH => 3

    /**
     * The host type is Windows Powershell.
     * Native name: WLDP_HOST_ID_POWERSHELL
     * @type {Integer (Int32)}
     */
    static POWERSHELL => 4

    /**
     * The host type is Internet Explorer.
     * Native name: WLDP_HOST_ID_IE
     * @type {Integer (Int32)}
     */
    static IE => 5

    /**
     * The host type is the Microsoft Windows Installer.
     * Native name: WLDP_HOST_ID_MSI
     * @type {Integer (Int32)}
     */
    static MSI => 6

    /**
     * Catch-all for custom objects without a subject interface package.
     * Native name: WLDP_HOST_ID_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 7

    /**
     * The maximum enumeration value.
     * Native name: WLDP_HOST_ID_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 8
}
