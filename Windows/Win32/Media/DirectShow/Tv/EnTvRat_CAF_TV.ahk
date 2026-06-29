#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct EnTvRat_CAF_TV {
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
    static CAF_TV_Exempt => 0

    /**
     * @type {Integer (Int32)}
     */
    static CAF_TV_G => 1

    /**
     * @type {Integer (Int32)}
     */
    static CAF_TV_8 => 2

    /**
     * @type {Integer (Int32)}
     */
    static CAF_TV_13 => 3

    /**
     * @type {Integer (Int32)}
     */
    static CAF_TV_16 => 4

    /**
     * @type {Integer (Int32)}
     */
    static CAF_TV_18 => 5

    /**
     * @type {Integer (Int32)}
     */
    static CAF_TV_Reserved6 => 6

    /**
     * @type {Integer (Int32)}
     */
    static CAF_TV_Reserved => 7
}
