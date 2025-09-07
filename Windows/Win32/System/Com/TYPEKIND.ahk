#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a type.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-typekind
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class TYPEKIND{

    /**
     * A set of enumerators.
     * @type {Integer (Int32)}
     */
    static TKIND_ENUM => 0

    /**
     * A structure with no methods.
     * @type {Integer (Int32)}
     */
    static TKIND_RECORD => 1

    /**
     * A module that can only have static functions and data (for example, a DLL).
     * @type {Integer (Int32)}
     */
    static TKIND_MODULE => 2

    /**
     * A type that has virtual and pure functions.
     * @type {Integer (Int32)}
     */
    static TKIND_INTERFACE => 3

    /**
     * A set of methods and properties that are accessible through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a>. By default, dual interfaces return TKIND_DISPATCH.
     * @type {Integer (Int32)}
     */
    static TKIND_DISPATCH => 4

    /**
     * A set of implemented component object interfaces.
     * @type {Integer (Int32)}
     */
    static TKIND_COCLASS => 5

    /**
     * A type that is an alias for another type.
     * @type {Integer (Int32)}
     */
    static TKIND_ALIAS => 6

    /**
     * A union, all of whose members have an offset of zero.
     * @type {Integer (Int32)}
     */
    static TKIND_UNION => 7

    /**
     * End of enum marker.
     * @type {Integer (Int32)}
     */
    static TKIND_MAX => 8
}
