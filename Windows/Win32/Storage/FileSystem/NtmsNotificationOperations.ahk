#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsNotificationOperations extends Win32Enum {

    /**
     * Native name: NTMS_OBJ_UPDATE
     * @type {Integer (Int32)}
     */
    static OBJ_UPDATE => 1

    /**
     * Native name: NTMS_OBJ_INSERT
     * @type {Integer (Int32)}
     */
    static OBJ_INSERT => 2

    /**
     * Native name: NTMS_OBJ_DELETE
     * @type {Integer (Int32)}
     */
    static OBJ_DELETE => 3

    /**
     * Native name: NTMS_EVENT_SIGNAL
     * @type {Integer (Int32)}
     */
    static EVENT_SIGNAL => 4

    /**
     * Native name: NTMS_EVENT_COMPLETE
     * @type {Integer (Int32)}
     */
    static EVENT_COMPLETE => 5
}
