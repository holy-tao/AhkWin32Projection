#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecVideoDXVABusEncryption {
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
    static eAVDecVideoDXVABusEncryption_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVABusEncryption_PRIVATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVABusEncryption_AES => 2
}
