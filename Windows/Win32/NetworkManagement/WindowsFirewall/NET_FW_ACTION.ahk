#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the action for a rule or default setting. (NET_FW_ACTION)
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_action
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NET_FW_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Block traffic.
     * @type {Integer (Int32)}
     */
    static NET_FW_ACTION_BLOCK => 0

    /**
     * Allow traffic.
     * @type {Integer (Int32)}
     */
    static NET_FW_ACTION_ALLOW => 1

    /**
     * Maximum traffic.
     * @type {Integer (Int32)}
     */
    static NET_FW_ACTION_MAX => 2
}
