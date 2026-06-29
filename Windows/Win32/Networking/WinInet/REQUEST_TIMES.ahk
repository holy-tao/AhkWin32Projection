#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct REQUEST_TIMES {
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
    static NameResolutionStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static NameResolutionEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static ConnectionEstablishmentStart => 2

    /**
     * @type {Integer (Int32)}
     */
    static ConnectionEstablishmentEnd => 3

    /**
     * @type {Integer (Int32)}
     */
    static TLSHandshakeStart => 4

    /**
     * @type {Integer (Int32)}
     */
    static TLSHandshakeEnd => 5

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimeMax => 32
}
