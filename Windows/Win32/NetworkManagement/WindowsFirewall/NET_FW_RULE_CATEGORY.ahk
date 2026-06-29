#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The firewall rule category.
 * @remarks
 * For more information about using <b>NET_FW_RULE_CATEGORY</b>, download the <a href="https://www.microsoft.com/downloads/details.aspx?FamilyID=08d23da9-ff0e-4e6f-b742-878ca1977c55">Windows Firewall and User Facing Impact</a> document.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_rule_category
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NET_FW_RULE_CATEGORY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies boot time filters.
     * @type {Integer (Int32)}
     */
    static NET_FW_RULE_CATEGORY_BOOT => 0

    /**
     * Specifies stealth filters.
     * @type {Integer (Int32)}
     */
    static NET_FW_RULE_CATEGORY_STEALTH => 1

    /**
     * Specifies firewall filters.
     * @type {Integer (Int32)}
     */
    static NET_FW_RULE_CATEGORY_FIREWALL => 2

    /**
     * Specifies connection security filters.
     * @type {Integer (Int32)}
     */
    static NET_FW_RULE_CATEGORY_CONSEC => 3

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static NET_FW_RULE_CATEGORY_MAX => 4
}
