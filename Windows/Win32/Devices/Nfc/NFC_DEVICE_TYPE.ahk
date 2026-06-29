#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_DEVICE_TYPE {
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
    static NfcType1Tag => 0

    /**
     * @type {Integer (Int32)}
     */
    static NfcType2Tag => 1

    /**
     * @type {Integer (Int32)}
     */
    static NfcType3Tag => 2

    /**
     * @type {Integer (Int32)}
     */
    static NfcType4Tag => 3

    /**
     * @type {Integer (Int32)}
     */
    static NfcIP1Target => 4

    /**
     * @type {Integer (Int32)}
     */
    static NfcIP1Initiator => 5

    /**
     * @type {Integer (Int32)}
     */
    static NfcReader => 6
}
