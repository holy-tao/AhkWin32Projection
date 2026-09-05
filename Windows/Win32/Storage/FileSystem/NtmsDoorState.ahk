#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsDoorState extends Win32Enum {

    /**
     * Native name: NTMS_DOORSTATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static DOORSTATE_UNKNOWN => 0

    /**
     * Native name: NTMS_DOORSTATE_CLOSED
     * @type {Integer (Int32)}
     */
    static DOORSTATE_CLOSED => 1

    /**
     * Native name: NTMS_DOORSTATE_OPEN
     * @type {Integer (Int32)}
     */
    static DOORSTATE_OPEN => 2
}
