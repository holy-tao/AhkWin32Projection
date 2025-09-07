#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsLmState{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_QUEUED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_INPROCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_PASSED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_FAILED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_INVALID => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_WAITING => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DEFERRED => 6

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_DEFFERED => 6

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_CANCELLED => 7

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LM_STOPPED => 8
}
