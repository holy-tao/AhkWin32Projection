#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type description being bound to.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ne-oaidl-desckind
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class DESCKIND{

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
