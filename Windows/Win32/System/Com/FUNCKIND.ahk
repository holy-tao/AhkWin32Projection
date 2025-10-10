#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the function type.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ne-oaidl-funckind
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class FUNCKIND{

    /**
     * The function is accessed the same as PUREVIRTUAL, except the function has an implementation.
     * @type {Integer (Int32)}
     */
    static FUNC_VIRTUAL => 0

    /**
     * The function is accessed through the virtual function table (VTBL), and takes an implicit this pointer.
     * @type {Integer (Int32)}
     */
    static FUNC_PUREVIRTUAL => 1

    /**
     * The function is accessed by static address and takes an implicit this pointer.
     * @type {Integer (Int32)}
     */
    static FUNC_NONVIRTUAL => 2

    /**
     * The function is accessed by static address and does not take an implicit this pointer.
     * @type {Integer (Int32)}
     */
    static FUNC_STATIC => 3

    /**
     * The function can be accessed only through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>.
     * @type {Integer (Int32)}
     */
    static FUNC_DISPATCH => 4
}
