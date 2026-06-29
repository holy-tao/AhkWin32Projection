#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecDDMatrixDecodingMode {
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
    static eAVDecDDMatrixDecodingMode_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecDDMatrixDecodingMode_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecDDMatrixDecodingMode_AUTO => 2
}
