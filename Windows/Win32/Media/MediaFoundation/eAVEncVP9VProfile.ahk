#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncVP9VProfile {
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
    static eAVEncVP9VProfile_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncVP9VProfile_420_8 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncVP9VProfile_420_10 => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncVP9VProfile_420_12 => 3
}
