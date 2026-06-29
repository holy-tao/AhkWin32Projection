#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct SF_REQ_TYPE {
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
    static SF_REQ_SEND_RESPONSE_HEADER => 0

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_ADD_HEADERS_ON_DENIAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_SET_NEXT_READ_SIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_SET_PROXY_INFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_GET_CONNID => 4

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_SET_CERTIFICATE_INFO => 5

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_GET_PROPERTY => 6

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_NORMALIZE_URL => 7

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_DISABLE_NOTIFICATIONS => 8
}
