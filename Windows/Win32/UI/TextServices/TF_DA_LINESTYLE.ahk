#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TF_DA_LINESTYLE enumeration specify the underline style of a display attribute in the TF_DA_COLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_linestyle
 * @namespace Windows.Win32.UI.TextServices
 */
class TF_DA_LINESTYLE extends Win32Enum {

    /**
     * The text is not underlined.
     * Native name: TF_LS_NONE
     * @type {Integer (Int32)}
     */
    static LS_NONE => 0

    /**
     * The text is underlined with a solid line.
     * Native name: TF_LS_SOLID
     * @type {Integer (Int32)}
     */
    static LS_SOLID => 1

    /**
     * The text is underlined with a dotted line.
     * Native name: TF_LS_DOT
     * @type {Integer (Int32)}
     */
    static LS_DOT => 2

    /**
     * The text is underlined with a dashed line.
     * Native name: TF_LS_DASH
     * @type {Integer (Int32)}
     */
    static LS_DASH => 3

    /**
     * The text is underlined with a solid wavy line.
     * Native name: TF_LS_SQUIGGLE
     * @type {Integer (Int32)}
     */
    static LS_SQUIGGLE => 4
}
