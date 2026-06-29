#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct StringFormatFlags {
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
    static StringFormatFlagsDirectionRightToLeft => 1

    /**
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsDirectionVertical => 2

    /**
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsNoFitBlackBox => 4

    /**
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsDisplayFormatControl => 32

    /**
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsNoFontFallback => 1024

    /**
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsMeasureTrailingSpaces => 2048

    /**
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsNoWrap => 4096

    /**
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsLineLimit => 8192

    /**
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsNoClip => 16384

    /**
     * @type {Integer (Int32)}
     */
    static StringFormatFlagsBypassGDI => -2147483648
}
