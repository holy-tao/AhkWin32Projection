#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type description being bound to.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-desckind
 * @namespace Windows.Win32.System.Com
 */
class DESCKIND extends Win32Enum {

    /**
     * No match was found.
     * Native name: DESCKIND_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-funcdesc">FUNCDESC</a> was returned.
     * Native name: DESCKIND_FUNCDESC
     * @type {Integer (Int32)}
     */
    static FUNCDESC => 1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-vardesc">VARDESC</a> was returned.
     * Native name: DESCKIND_VARDESC
     * @type {Integer (Int32)}
     */
    static VARDESC => 2

    /**
     * A TYPECOMP was returned.
     * Native name: DESCKIND_TYPECOMP
     * @type {Integer (Int32)}
     */
    static TYPECOMP => 3

    /**
     * An IMPLICITAPPOBJ was returned.
     * Native name: DESCKIND_IMPLICITAPPOBJ
     * @type {Integer (Int32)}
     */
    static IMPLICITAPPOBJ => 4

    /**
     * The end of the enum.
     * Native name: DESCKIND_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 5
}
