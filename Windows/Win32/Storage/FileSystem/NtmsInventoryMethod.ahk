#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsInventoryMethod extends Win32Enum {

    /**
     * Native name: NTMS_INVENTORY_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: NTMS_INVENTORY_FAST
     * @type {Integer (Int32)}
     */
    static FAST => 1

    /**
     * Native name: NTMS_INVENTORY_OMID
     * @type {Integer (Int32)}
     */
    static OMID => 2

    /**
     * Native name: NTMS_INVENTORY_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 3

    /**
     * Native name: NTMS_INVENTORY_SLOT
     * @type {Integer (Int32)}
     */
    static SLOT => 4

    /**
     * Native name: NTMS_INVENTORY_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 5

    /**
     * Native name: NTMS_INVENTORY_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 6
}
