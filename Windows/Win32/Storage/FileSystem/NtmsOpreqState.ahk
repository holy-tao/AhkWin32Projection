#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsOpreqState{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_SUBMITTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_ACTIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_INPROGRESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_REFUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_COMPLETE => 5
}
