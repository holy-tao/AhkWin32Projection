#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TF_DA_LINESTYLE enumeration specify the underline style of a display attribute in the TF_DA_COLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_linestyle
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_DA_LINESTYLE{

    /**
     * The text is not underlined.
     * @type {Integer (Int32)}
     */
    static TF_LS_NONE => 0

    /**
     * The text is underlined with a solid line.
     * @type {Integer (Int32)}
     */
    static TF_LS_SOLID => 1

    /**
     * The text is underlined with a dotted line.
     * @type {Integer (Int32)}
     */
    static TF_LS_DOT => 2

    /**
     * The text is underlined with a dashed line.
     * @type {Integer (Int32)}
     */
    static TF_LS_DASH => 3

    /**
     * The text is underlined with a solid wavy line.
     * @type {Integer (Int32)}
     */
    static TF_LS_SQUIGGLE => 4
}
