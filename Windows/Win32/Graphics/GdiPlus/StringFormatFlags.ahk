#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class StringFormatFlags extends Win32Enum{

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
