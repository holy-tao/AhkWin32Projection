#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct EnTvRat_MPAA {
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
    static MPAA_NotApplicable => 0

    /**
     * @type {Integer (Int32)}
     */
    static MPAA_G => 1

    /**
     * @type {Integer (Int32)}
     */
    static MPAA_PG => 2

    /**
     * @type {Integer (Int32)}
     */
    static MPAA_PG13 => 3

    /**
     * @type {Integer (Int32)}
     */
    static MPAA_R => 4

    /**
     * @type {Integer (Int32)}
     */
    static MPAA_NC17 => 5

    /**
     * @type {Integer (Int32)}
     */
    static MPAA_X => 6

    /**
     * @type {Integer (Int32)}
     */
    static MPAA_NotRated => 7
}
