#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the effect of modifications to the current policy.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_modify_state
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_MODIFY_STATE extends Win32Enum{

    /**
     * Changing or adding a firewall rule or firewall group to the current profile will take effect.
     * @type {Integer (Int32)}
     */
    static NET_FW_MODIFY_STATE_OK => 0

    /**
     * Changing or adding a firewall rule or firewall group to the current profile will not take effect because the profile is controlled by the group policy.
     * @type {Integer (Int32)}
     */
    static NET_FW_MODIFY_STATE_GP_OVERRIDE => 1

    /**
     * Changing or adding a firewall rule or firewall group to the current profile will not take effect because unsolicited inbound traffic is not allowed.
     * @type {Integer (Int32)}
     */
    static NET_FW_MODIFY_STATE_INBOUND_BLOCKED => 2
}
