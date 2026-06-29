#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURE_PROTOCOL {
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
    static WS_SECURE_PROTOCOL_SSL2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURE_PROTOCOL_SSL3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURE_PROTOCOL_TLS1_0 => 4

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURE_PROTOCOL_TLS1_1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static WS_SECURE_PROTOCOL_TLS1_2 => 16
}
