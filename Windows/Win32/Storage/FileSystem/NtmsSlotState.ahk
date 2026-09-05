#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsSlotState extends Win32Enum {

    /**
     * Native name: NTMS_SLOTSTATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static SLOTSTATE_UNKNOWN => 0

    /**
     * Native name: NTMS_SLOTSTATE_FULL
     * @type {Integer (Int32)}
     */
    static SLOTSTATE_FULL => 1

    /**
     * Native name: NTMS_SLOTSTATE_EMPTY
     * @type {Integer (Int32)}
     */
    static SLOTSTATE_EMPTY => 2

    /**
     * Native name: NTMS_SLOTSTATE_NOTPRESENT
     * @type {Integer (Int32)}
     */
    static SLOTSTATE_NOTPRESENT => 3

    /**
     * Native name: NTMS_SLOTSTATE_NEEDSINVENTORY
     * @type {Integer (Int32)}
     */
    static SLOTSTATE_NEEDSINVENTORY => 4
}
