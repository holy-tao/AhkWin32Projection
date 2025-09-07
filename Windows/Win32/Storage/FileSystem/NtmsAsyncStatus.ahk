#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsAsyncStatus{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ASYNCSTATE_QUEUED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ASYNCSTATE_WAIT_RESOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ASYNCSTATE_WAIT_OPERATOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ASYNCSTATE_INPROCESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ASYNCSTATE_COMPLETE => 4
}
