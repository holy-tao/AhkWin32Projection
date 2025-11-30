#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the scope of addresses from which a port can listen.
 * @see https://docs.microsoft.com/windows/win32/api//icftypes/ne-icftypes-net_fw_scope
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_SCOPE extends Win32Enum{

    /**
     * Scope is all.
     * @type {Integer (Int32)}
     */
    static NET_FW_SCOPE_ALL => 0

    /**
     * Scope is local subnet only.
     * @type {Integer (Int32)}
     */
    static NET_FW_SCOPE_LOCAL_SUBNET => 1

    /**
     * Scope is custom.
     * @type {Integer (Int32)}
     */
    static NET_FW_SCOPE_CUSTOM => 2

    /**
     * Used for boundary checking only. Not valid for application programming.
     * @type {Integer (Int32)}
     */
    static NET_FW_SCOPE_MAX => 3
}
