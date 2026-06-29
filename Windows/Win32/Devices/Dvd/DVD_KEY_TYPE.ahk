#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_KEY_TYPE {
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
    static DvdChallengeKey => 1

    /**
     * @type {Integer (Int32)}
     */
    static DvdBusKey1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DvdBusKey2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DvdTitleKey => 4

    /**
     * @type {Integer (Int32)}
     */
    static DvdAsf => 5

    /**
     * @type {Integer (Int32)}
     */
    static DvdSetRpcKey => 6

    /**
     * @type {Integer (Int32)}
     */
    static DvdGetRpcKey => 8

    /**
     * @type {Integer (Int32)}
     */
    static DvdDiskKey => 128

    /**
     * @type {Integer (Int32)}
     */
    static DvdInvalidateAGID => 63
}
