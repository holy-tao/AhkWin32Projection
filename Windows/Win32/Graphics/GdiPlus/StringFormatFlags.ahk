#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class StringFormatFlags extends Win32Enum {

    /**
     * Native name: StringFormatFlagsDirectionRightToLeft
     * @type {Integer (Int32)}
     */
    static DirectionRightToLeft => 1

    /**
     * Native name: StringFormatFlagsDirectionVertical
     * @type {Integer (Int32)}
     */
    static DirectionVertical => 2

    /**
     * Native name: StringFormatFlagsNoFitBlackBox
     * @type {Integer (Int32)}
     */
    static NoFitBlackBox => 4

    /**
     * Native name: StringFormatFlagsDisplayFormatControl
     * @type {Integer (Int32)}
     */
    static DisplayFormatControl => 32

    /**
     * Native name: StringFormatFlagsNoFontFallback
     * @type {Integer (Int32)}
     */
    static NoFontFallback => 1024

    /**
     * Native name: StringFormatFlagsMeasureTrailingSpaces
     * @type {Integer (Int32)}
     */
    static MeasureTrailingSpaces => 2048

    /**
     * Native name: StringFormatFlagsNoWrap
     * @type {Integer (Int32)}
     */
    static NoWrap => 4096

    /**
     * Native name: StringFormatFlagsLineLimit
     * @type {Integer (Int32)}
     */
    static LineLimit => 8192

    /**
     * Native name: StringFormatFlagsNoClip
     * @type {Integer (Int32)}
     */
    static NoClip => 16384

    /**
     * Native name: StringFormatFlagsBypassGDI
     * @type {Integer (Int32)}
     */
    static BypassGDI => -2147483648
}
