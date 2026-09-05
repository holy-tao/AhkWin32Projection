#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class OPLOCK_NOTIFY_REASON extends Win32Enum {

    /**
     * Native name: OPLOCK_NOTIFY_BREAK_WAIT_INTERIM_TIMEOUT
     * @type {Integer (Int32)}
     */
    static BREAK_WAIT_INTERIM_TIMEOUT => 0

    /**
     * Native name: OPLOCK_NOTIFY_BREAK_WAIT_TERMINATED
     * @type {Integer (Int32)}
     */
    static BREAK_WAIT_TERMINATED => 1
}
