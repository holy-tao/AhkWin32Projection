#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the direction of traffic to which a rule applies.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_rule_direction
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NET_FW_RULE_DIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The rule applies to inbound traffic.
     * @type {Integer (Int32)}
     */
    static NET_FW_RULE_DIR_IN => 1

    /**
     * The rule applies to outbound traffic.
     * @type {Integer (Int32)}
     */
    static NET_FW_RULE_DIR_OUT => 2

    /**
     * This value is used for boundary checking only and is not valid for application programming.
     * @type {Integer (Int32)}
     */
    static NET_FW_RULE_DIR_MAX => 3
}
