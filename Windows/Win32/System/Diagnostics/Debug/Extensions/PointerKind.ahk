#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class PointerKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PointerStandard => 0

    /**
     * @type {Integer (Int32)}
     */
    static PointerReference => 1

    /**
     * @type {Integer (Int32)}
     */
    static PointerRValueReference => 2

    /**
     * @type {Integer (Int32)}
     */
    static PointerCXHat => 3

    /**
     * @type {Integer (Int32)}
     */
    static PointerManagedReference => 4
}
