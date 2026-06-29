#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncChromaEncodeMode {
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
    static eAVEncChromaEncodeMode_420 => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncChromaEncodeMode_444 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncChromaEncodeMode_444_v2 => 2
}
