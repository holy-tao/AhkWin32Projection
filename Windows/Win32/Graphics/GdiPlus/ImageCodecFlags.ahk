#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ImageCodecFlags {
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
    static ImageCodecFlagsEncoder => 1

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsDecoder => 2

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSupportBitmap => 4

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSupportVector => 8

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSeekableEncode => 16

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsBlockingDecode => 32

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsBuiltin => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsSystem => 131072

    /**
     * @type {Integer (Int32)}
     */
    static ImageCodecFlagsUser => 262144
}
