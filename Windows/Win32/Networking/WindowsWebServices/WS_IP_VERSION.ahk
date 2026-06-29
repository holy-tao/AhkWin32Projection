#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies an IP version.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_ip_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_IP_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use IPv4.
     * @type {Integer (Int32)}
     */
    static WS_IP_VERSION_4 => 1

    /**
     * Use IPv6.
     * @type {Integer (Int32)}
     */
    static WS_IP_VERSION_6 => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_IP_VERSION_AUTO => 3
}
