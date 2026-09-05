#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the end of line character used by an edit control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ne-commctrl-ec_endofline
 * @namespace Windows.Win32.UI.Controls
 */
class EC_ENDOFLINE extends Win32Enum {

    /**
     * End of line character specified in content.
     * Native name: EC_ENDOFLINE_DETECTFROMCONTENT
     * @type {Integer (Int32)}
     */
    static DETECTFROMCONTENT => 0

    /**
     * End of line character is CRLF.
     * Native name: EC_ENDOFLINE_CRLF
     * @type {Integer (Int32)}
     */
    static CRLF => 1

    /**
     * End of line character is CR.
     * Native name: EC_ENDOFLINE_CR
     * @type {Integer (Int32)}
     */
    static CR => 2

    /**
     * End of line character is LF.
     * Native name: EC_ENDOFLINE_LF
     * @type {Integer (Int32)}
     */
    static LF => 3
}
