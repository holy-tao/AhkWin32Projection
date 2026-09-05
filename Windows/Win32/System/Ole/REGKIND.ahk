#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Controls how a type library is registered.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ne-oleauto-regkind
 * @namespace Windows.Win32.System.Ole
 */
class REGKIND extends Win32Enum {

    /**
     * Use default register behavior.
     * Native name: REGKIND_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Register this type library.
     * Native name: REGKIND_REGISTER
     * @type {Integer (Int32)}
     */
    static REGISTER => 1

    /**
     * Do not register this type library.
     * Native name: REGKIND_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2
}
