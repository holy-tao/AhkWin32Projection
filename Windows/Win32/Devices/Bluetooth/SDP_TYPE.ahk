#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct SDP_TYPE {
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
    static SDP_TYPE_NIL => 0

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_UINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_INT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_UUID => 3

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_STRING => 4

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_BOOLEAN => 5

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_SEQUENCE => 6

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_ALTERNATIVE => 7

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_URL => 8

    /**
     * @type {Integer (Int32)}
     */
    static SDP_TYPE_CONTAINER => 32
}
