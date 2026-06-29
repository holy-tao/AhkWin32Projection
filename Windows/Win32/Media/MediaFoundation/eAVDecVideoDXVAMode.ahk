#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecVideoDXVAMode {
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
    static eAVDecVideoDXVAMode_NOTPLAYING => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVAMode_SW => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVAMode_MC => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVAMode_IDCT => 3

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVAMode_VLD => 4
}
