#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the variable type.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-varkind
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class VARKIND extends Win32Enum{

    /**
     * The variable is a field or member of the type. It exists at a fixed offset within each instance of the type.
     * @type {Integer (Int32)}
     */
    static VAR_PERINSTANCE => 0

    /**
     * There is only one instance of the variable.
     * @type {Integer (Int32)}
     */
    static VAR_STATIC => 1

    /**
     * The VARDESC describes a symbolic constant. There is no memory associated with it.
     * @type {Integer (Int32)}
     */
    static VAR_CONST => 2

    /**
     * The variable can only be accessed through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a>.
     * @type {Integer (Int32)}
     */
    static VAR_DISPATCH => 3
}
