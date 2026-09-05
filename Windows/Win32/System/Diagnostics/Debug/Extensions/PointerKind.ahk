#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class PointerKind extends Win32Enum {

    /**
     * Native name: PointerStandard
     * @type {Integer (Int32)}
     */
    static Standard => 0

    /**
     * Native name: PointerReference
     * @type {Integer (Int32)}
     */
    static Reference => 1

    /**
     * @type {Integer (Int32)}
     */
    static PointerRValueReference => 2

    /**
     * @type {Integer (Int32)}
     */
    static PointerCXHat => 3

    /**
     * Native name: PointerManagedReference
     * @type {Integer (Int32)}
     */
    static ManagedReference => 4
}
