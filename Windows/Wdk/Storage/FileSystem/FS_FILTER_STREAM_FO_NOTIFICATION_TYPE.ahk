#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FS_FILTER_STREAM_FO_NOTIFICATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NotifyTypeCreate => 0

    /**
     * @type {Integer (Int32)}
     */
    static NotifyTypeRetired => 1
}
