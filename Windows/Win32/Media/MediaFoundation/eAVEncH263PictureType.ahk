#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncH263PictureType {
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
    static eAVEncH263PictureType_I => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263PictureType_P => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263PictureType_B => 2
}
