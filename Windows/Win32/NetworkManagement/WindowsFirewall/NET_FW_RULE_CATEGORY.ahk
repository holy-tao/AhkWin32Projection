#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The firewall rule category.
 * @remarks
 * For more information about using <b>NET_FW_RULE_CATEGORY</b>, download the <a href="https://www.microsoft.com/downloads/details.aspx?FamilyID=08d23da9-ff0e-4e6f-b742-878ca1977c55">Windows Firewall and User Facing Impact</a> document.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_rule_category
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NET_FW_RULE_CATEGORY extends Win32Enum {

    /**
     * Specifies boot time filters.
     * Native name: NET_FW_RULE_CATEGORY_BOOT
     * @type {Integer (Int32)}
     */
    static BOOT => 0

    /**
     * Specifies stealth filters.
     * Native name: NET_FW_RULE_CATEGORY_STEALTH
     * @type {Integer (Int32)}
     */
    static STEALTH => 1

    /**
     * Specifies firewall filters.
     * Native name: NET_FW_RULE_CATEGORY_FIREWALL
     * @type {Integer (Int32)}
     */
    static FIREWALL => 2

    /**
     * Specifies connection security filters.
     * Native name: NET_FW_RULE_CATEGORY_CONSEC
     * @type {Integer (Int32)}
     */
    static CONSEC => 3

    /**
     * Maximum value for testing purposes.
     * Native name: NET_FW_RULE_CATEGORY_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 4
}
