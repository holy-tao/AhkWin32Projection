#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_MGMT_NOTIFICATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ClfsMgmtAdvanceTailNotification => 0

    /**
     * @type {Integer (Int32)}
     */
    static ClfsMgmtLogFullHandlerNotification => 1

    /**
     * @type {Integer (Int32)}
     */
    static ClfsMgmtLogUnpinnedNotification => 2

    /**
     * @type {Integer (Int32)}
     */
    static ClfsMgmtLogWriteNotification => 3
}
