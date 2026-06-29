#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_MAX_PAYLOAD_SIZE {
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
    static MaxPayload128Bytes => 0

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload256Bytes => 1

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload512Bytes => 2

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload1024Bytes => 3

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload2048Bytes => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload4096Bytes => 5
}
