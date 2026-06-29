#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CERT_GET_CONFIG_FLAGS {
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
    static CC_DEFAULTCONFIG => 0

    /**
     * @type {Integer (Int32)}
     */
    static CC_FIRSTCONFIG => 2

    /**
     * @type {Integer (Int32)}
     */
    static CC_LOCALACTIVECONFIG => 4

    /**
     * @type {Integer (Int32)}
     */
    static CC_LOCALCONFIG => 3

    /**
     * @type {Integer (Int32)}
     */
    static CC_UIPICKCONFIG => 1

    /**
     * @type {Integer (Int32)}
     */
    static CC_UIPICKCONFIGSKIPLOCALCA => 5
}
