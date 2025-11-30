#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class OPLOCK_NOTIFY_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OPLOCK_NOTIFY_BREAK_WAIT_INTERIM_TIMEOUT => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPLOCK_NOTIFY_BREAK_WAIT_TERMINATED => 1
}
