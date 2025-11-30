#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NET_FW_POLICY_TYPE enumerated type specifies the type of policy.
 * @see https://docs.microsoft.com/windows/win32/api//icftypes/ne-icftypes-net_fw_policy_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_POLICY_TYPE extends Win32Enum{

    /**
     * Policy type is group.
     * @type {Integer (Int32)}
     */
    static NET_FW_POLICY_GROUP => 0

    /**
     * Policy type is local.
     * @type {Integer (Int32)}
     */
    static NET_FW_POLICY_LOCAL => 1

    /**
     * Policy type is effective.
     * @type {Integer (Int32)}
     */
    static NET_FW_POLICY_EFFECTIVE => 2

    /**
     * Used for boundary checking only. Not valid for application programming.
     * @type {Integer (Int32)}
     */
    static NET_FW_POLICY_TYPE_MAX => 3
}
