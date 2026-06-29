#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Type of user comment in a IMEWRD structure.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ne-msime-imeuct
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEUCT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static IFED_UCT_MAX => 4
}
