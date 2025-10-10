#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the action for a rule or default setting.
 * @see https://docs.microsoft.com/windows/win32/api//icftypes/ne-icftypes-net_fw_action
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_ACTION{

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
