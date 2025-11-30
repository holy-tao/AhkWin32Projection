#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsMediaState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_IDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_INUSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_MOUNTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_LOADED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_UNLOADED => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_OPERROR => 5

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MEDIASTATE_OPREQ => 6
}
