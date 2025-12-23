#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the moniker's class.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-mksys
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class MKSYS extends Win32Enum{

    /**
     * Indicates a custom moniker implementation.
     * @type {Integer (Int32)}
     */
    static MKSYS_NONE => 0

    /**
     * Indicates the system's generic composite moniker class.
     * @type {Integer (Int32)}
     */
    static MKSYS_GENERICCOMPOSITE => 1

    /**
     * Indicates the system's file moniker class.
     * @type {Integer (Int32)}
     */
    static MKSYS_FILEMONIKER => 2

    /**
     * Indicates the system's anti-moniker class.
     * @type {Integer (Int32)}
     */
    static MKSYS_ANTIMONIKER => 3

    /**
     * Indicates the system's item moniker class.
     * @type {Integer (Int32)}
     */
    static MKSYS_ITEMMONIKER => 4

    /**
     * Indicates the system's pointer moniker class.
     * @type {Integer (Int32)}
     */
    static MKSYS_POINTERMONIKER => 5

    /**
     * Indicates the system's class moniker class.
     * @type {Integer (Int32)}
     */
    static MKSYS_CLASSMONIKER => 7

    /**
     * Indicates the system's OBJREF moniker class.
     * @type {Integer (Int32)}
     */
    static MKSYS_OBJREFMONIKER => 8

    /**
     * Indicates the system's terminal server session moniker class.
     * @type {Integer (Int32)}
     */
    static MKSYS_SESSIONMONIKER => 9

    /**
     * Indicates the system's elevation moniker class.
     * @type {Integer (Int32)}
     */
    static MKSYS_LUAMONIKER => 10
}
