#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the Internet protocol.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_ip_protocol
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NET_FW_IP_PROTOCOL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Transmission Control Protocol.
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_PROTOCOL_TCP => 6

    /**
     * User Datagram Protocol.
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_PROTOCOL_UDP => 17

    /**
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_PROTOCOL_ANY => 256
}
