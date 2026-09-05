#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the scope of addresses from which a port can listen.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_scope
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NET_FW_SCOPE extends Win32Enum {

    /**
     * Scope is all.
     * Native name: NET_FW_SCOPE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 0

    /**
     * Scope is local subnet only.
     * Native name: NET_FW_SCOPE_LOCAL_SUBNET
     * @type {Integer (Int32)}
     */
    static LOCAL_SUBNET => 1

    /**
     * Scope is custom.
     * Native name: NET_FW_SCOPE_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 2

    /**
     * Used for boundary checking only. Not valid for application programming.
     * Native name: NET_FW_SCOPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
