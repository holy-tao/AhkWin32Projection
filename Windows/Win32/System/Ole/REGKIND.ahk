#Requires AutoHotkey v2.0.0 64-bit

/**
 * Controls how a type library is registered.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ne-oleauto-regkind
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class REGKIND{

    /**
     * Use default register behavior.
     * @type {Integer (Int32)}
     */
    static REGKIND_DEFAULT => 0

    /**
     * Register this type library.
     * @type {Integer (Int32)}
     */
    static REGKIND_REGISTER => 1

    /**
     * Do not register this type library.
     * @type {Integer (Int32)}
     */
    static REGKIND_NONE => 2
}
