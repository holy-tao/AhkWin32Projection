#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPO_LINK extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GPLinkUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static GPLinkMachine => 1

    /**
     * @type {Integer (Int32)}
     */
    static GPLinkSite => 2

    /**
     * @type {Integer (Int32)}
     */
    static GPLinkDomain => 3

    /**
     * @type {Integer (Int32)}
     */
    static GPLinkOrganizationalUnit => 4
}
