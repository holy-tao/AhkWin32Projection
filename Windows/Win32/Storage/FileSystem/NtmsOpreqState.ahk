#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsOpreqState extends Win32Enum {

    /**
     * Native name: NTMS_OPSTATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static OPSTATE_UNKNOWN => 0

    /**
     * Native name: NTMS_OPSTATE_SUBMITTED
     * @type {Integer (Int32)}
     */
    static OPSTATE_SUBMITTED => 1

    /**
     * Native name: NTMS_OPSTATE_ACTIVE
     * @type {Integer (Int32)}
     */
    static OPSTATE_ACTIVE => 2

    /**
     * Native name: NTMS_OPSTATE_INPROGRESS
     * @type {Integer (Int32)}
     */
    static OPSTATE_INPROGRESS => 3

    /**
     * Native name: NTMS_OPSTATE_REFUSED
     * @type {Integer (Int32)}
     */
    static OPSTATE_REFUSED => 4

    /**
     * Native name: NTMS_OPSTATE_COMPLETE
     * @type {Integer (Int32)}
     */
    static OPSTATE_COMPLETE => 5
}
