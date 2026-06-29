#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The StatusCode enum contains status codes for IPv6 operations.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpv6csdk/ne-dhcpv6csdk-statuscode
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct StatusCode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_ERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_UNSPECIFIED_FAILURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NO_BINDING => 3

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_NOPREFIX_AVAIL => 6
}
