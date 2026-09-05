#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the moniker's class.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-mksys
 * @namespace Windows.Win32.System.Com
 */
class MKSYS extends Win32Enum {

    /**
     * Indicates a custom moniker implementation.
     * Native name: MKSYS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Indicates the system's generic composite moniker class.
     * Native name: MKSYS_GENERICCOMPOSITE
     * @type {Integer (Int32)}
     */
    static GENERICCOMPOSITE => 1

    /**
     * Indicates the system's file moniker class.
     * Native name: MKSYS_FILEMONIKER
     * @type {Integer (Int32)}
     */
    static FILEMONIKER => 2

    /**
     * Indicates the system's anti-moniker class.
     * Native name: MKSYS_ANTIMONIKER
     * @type {Integer (Int32)}
     */
    static ANTIMONIKER => 3

    /**
     * Indicates the system's item moniker class.
     * Native name: MKSYS_ITEMMONIKER
     * @type {Integer (Int32)}
     */
    static ITEMMONIKER => 4

    /**
     * Indicates the system's pointer moniker class.
     * Native name: MKSYS_POINTERMONIKER
     * @type {Integer (Int32)}
     */
    static POINTERMONIKER => 5

    /**
     * Indicates the system's class moniker class.
     * Native name: MKSYS_CLASSMONIKER
     * @type {Integer (Int32)}
     */
    static CLASSMONIKER => 7

    /**
     * Indicates the system's OBJREF moniker class.
     * Native name: MKSYS_OBJREFMONIKER
     * @type {Integer (Int32)}
     */
    static OBJREFMONIKER => 8

    /**
     * Indicates the system's terminal server session moniker class.
     * Native name: MKSYS_SESSIONMONIKER
     * @type {Integer (Int32)}
     */
    static SESSIONMONIKER => 9

    /**
     * Indicates the system's elevation moniker class.
     * Native name: MKSYS_LUAMONIKER
     * @type {Integer (Int32)}
     */
    static LUAMONIKER => 10
}
