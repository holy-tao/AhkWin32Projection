#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the type of IP address.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_ip_address_type
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDSTRANSPORT_IP_ADDRESS_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default value that indicates that the IP address type has not yet been determined.
     * @type {Integer (Int32)}
     */
    static WdsTptIpAddressUnknown => 0

    /**
     * Indicates an IPv4 address.
     * @type {Integer (Int32)}
     */
    static WdsTptIpAddressIpv4 => 1

    /**
     * Indicates an IPv6 address.
     * @type {Integer (Int32)}
     */
    static WdsTptIpAddressIpv6 => 2
}
