#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the end of line character used by an edit control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ne-commctrl-ec_endofline
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class EC_ENDOFLINE extends Win32Enum{

    /**
     * End of line character specified in content.
     * @type {Integer (Int32)}
     */
    static EC_ENDOFLINE_DETECTFROMCONTENT => 0

    /**
     * End of line character is CRLF.
     * @type {Integer (Int32)}
     */
    static EC_ENDOFLINE_CRLF => 1

    /**
     * End of line character is CR.
     * @type {Integer (Int32)}
     */
    static EC_ENDOFLINE_CR => 2

    /**
     * End of line character is LF.
     * @type {Integer (Int32)}
     */
    static EC_ENDOFLINE_LF => 3
}
