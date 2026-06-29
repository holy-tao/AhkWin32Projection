#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct EnTvRat_CAE_TV {
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
    static CAE_TV_Exempt => 0

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_C => 1

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_C8 => 2

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_G => 3

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_PG => 4

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_14 => 5

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_18 => 6

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_Reserved => 7
}
