#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of authentication which must occur in order for traffic to be allowed.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_authenticate_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NET_FW_AUTHENTICATE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No security check is performed.
     * @type {Integer (Int32)}
     */
    static NET_FW_AUTHENTICATE_NONE => 0

    /**
     * The traffic is allowed if it is IPsec-protected with authentication and no encapsulation protection. This means that the peer is authenticated, but there is no integrity protection on the data.
     * @type {Integer (Int32)}
     */
    static NET_FW_AUTHENTICATE_NO_ENCAPSULATION => 1

    /**
     * The traffic is allowed if it is IPsec-protected with authentication and integrity protection.
     * @type {Integer (Int32)}
     */
    static NET_FW_AUTHENTICATE_WITH_INTEGRITY => 2

    /**
     * The traffic is allowed if its is IPsec-protected with authentication and integrity protection. In addition, negotiation of encryption protections on subsequent packets is requested.
     * @type {Integer (Int32)}
     */
    static NET_FW_AUTHENTICATE_AND_NEGOTIATE_ENCRYPTION => 3

    /**
     * The traffic is allowed if it is IPsec-protected with authentication, integrity and encryption protection since the very first packet.
     * @type {Integer (Int32)}
     */
    static NET_FW_AUTHENTICATE_AND_ENCRYPT => 4
}
