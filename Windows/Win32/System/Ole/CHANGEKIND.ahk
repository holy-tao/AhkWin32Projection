#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct CHANGEKIND {
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
    static CHANGEKIND_ADDMEMBER => 0

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_DELETEMEMBER => 1

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_SETNAMES => 2

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_SETDOCUMENTATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_GENERAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_INVALIDATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_CHANGEFAILED => 6

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_MAX => 7
}
