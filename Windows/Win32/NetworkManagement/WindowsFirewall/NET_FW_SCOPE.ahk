#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the scope of addresses from which a port can listen.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_scope
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NET_FW_SCOPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
