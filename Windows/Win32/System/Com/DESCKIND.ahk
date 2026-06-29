#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the type description being bound to.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-desckind
 * @namespace Windows.Win32.System.Com
 */
export default struct DESCKIND {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No match was found.
     * @type {Integer (Int32)}
     */
    static DESCKIND_NONE => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-funcdesc">FUNCDESC</a> was returned.
     * @type {Integer (Int32)}
     */
    static DESCKIND_FUNCDESC => 1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-vardesc">VARDESC</a> was returned.
     * @type {Integer (Int32)}
     */
    static DESCKIND_VARDESC => 2

    /**
     * A TYPECOMP was returned.
     * @type {Integer (Int32)}
     */
    static DESCKIND_TYPECOMP => 3

    /**
     * An IMPLICITAPPOBJ was returned.
     * @type {Integer (Int32)}
     */
    static DESCKIND_IMPLICITAPPOBJ => 4

    /**
     * The end of the enum.
     * @type {Integer (Int32)}
     */
    static DESCKIND_MAX => 5
}
