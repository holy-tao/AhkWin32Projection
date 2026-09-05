#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class CLFS_MGMT_NOTIFICATION_TYPE extends Win32Enum {

    /**
     * Native name: ClfsMgmtAdvanceTailNotification
     * @type {Integer (Int32)}
     */
    static AdvanceTailNotification => 0

    /**
     * Native name: ClfsMgmtLogFullHandlerNotification
     * @type {Integer (Int32)}
     */
    static LogFullHandlerNotification => 1

    /**
     * Native name: ClfsMgmtLogUnpinnedNotification
     * @type {Integer (Int32)}
     */
    static LogUnpinnedNotification => 2

    /**
     * Native name: ClfsMgmtLogWriteNotification
     * @type {Integer (Int32)}
     */
    static LogWriteNotification => 3
}
