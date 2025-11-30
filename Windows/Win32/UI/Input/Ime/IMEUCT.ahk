#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Type of user comment in a IMEWRD structure.
 * @see https://docs.microsoft.com/windows/win32/api//msime/ne-msime-imeuct
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEUCT extends Win32Enum{

    /**
     * No comment string is specified.
     * @type {Integer (Int32)}
     */
    static IFED_UCT_NONE => 0

    /**
     * The comment is an SJIS string.
     * @type {Integer (Int32)}
     */
    static IFED_UCT_STRING_SJIS => 1

    /**
     * The comment is a Unicode string.
     * @type {Integer (Int32)}
     */
    static IFED_UCT_STRING_UNICODE => 2

    /**
     * The comment is in a user-defined format.
     * @type {Integer (Int32)}
     */
    static IFED_UCT_USER_DEFINED => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IFED_UCT_MAX => 4
}
