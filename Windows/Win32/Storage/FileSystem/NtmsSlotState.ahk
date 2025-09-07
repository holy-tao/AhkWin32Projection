#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsSlotState{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_SLOTSTATE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_SLOTSTATE_FULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_SLOTSTATE_EMPTY => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_SLOTSTATE_NOTPRESENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_SLOTSTATE_NEEDSINVENTORY => 4
}
