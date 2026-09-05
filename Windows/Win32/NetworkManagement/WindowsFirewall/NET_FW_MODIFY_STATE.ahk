#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the effect of modifications to the current policy.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_modify_state
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NET_FW_MODIFY_STATE extends Win32Enum {

    /**
     * Changing or adding a firewall rule or firewall group to the current profile will take effect.
     * Native name: NET_FW_MODIFY_STATE_OK
     * @type {Integer (Int32)}
     */
    static OK => 0

    /**
     * Changing or adding a firewall rule or firewall group to the current profile will not take effect because the profile is controlled by the group policy.
     * Native name: NET_FW_MODIFY_STATE_GP_OVERRIDE
     * @type {Integer (Int32)}
     */
    static GP_OVERRIDE => 1

    /**
     * Changing or adding a firewall rule or firewall group to the current profile will not take effect because unsolicited inbound traffic is not allowed.
     * Native name: NET_FW_MODIFY_STATE_INBOUND_BLOCKED
     * @type {Integer (Int32)}
     */
    static INBOUND_BLOCKED => 2
}
