#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct MPEGLAYER3WAVEFORMAT_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_FLAG_PADDING_ISO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_FLAG_PADDING_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_FLAG_PADDING_OFF => 2
}
