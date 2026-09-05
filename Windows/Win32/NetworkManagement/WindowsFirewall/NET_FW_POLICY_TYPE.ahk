#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NET_FW_POLICY_TYPE enumerated type specifies the type of policy.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_policy_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NET_FW_POLICY_TYPE extends Win32Enum {

    /**
     * Policy type is group.
     * Native name: NET_FW_POLICY_GROUP
     * @type {Integer (Int32)}
     */
    static GROUP => 0

    /**
     * Policy type is local.
     * Native name: NET_FW_POLICY_LOCAL
     * @type {Integer (Int32)}
     */
    static LOCAL => 1

    /**
     * Policy type is effective.
     * Native name: NET_FW_POLICY_EFFECTIVE
     * @type {Integer (Int32)}
     */
    static EFFECTIVE => 2

    /**
     * Used for boundary checking only. Not valid for application programming.
     * Native name: NET_FW_POLICY_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
