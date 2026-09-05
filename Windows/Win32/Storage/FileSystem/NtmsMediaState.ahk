#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsMediaState extends Win32Enum {

    /**
     * Native name: NTMS_MEDIASTATE_IDLE
     * @type {Integer (Int32)}
     */
    static MEDIASTATE_IDLE => 0

    /**
     * Native name: NTMS_MEDIASTATE_INUSE
     * @type {Integer (Int32)}
     */
    static MEDIASTATE_INUSE => 1

    /**
     * Native name: NTMS_MEDIASTATE_MOUNTED
     * @type {Integer (Int32)}
     */
    static MEDIASTATE_MOUNTED => 2

    /**
     * Native name: NTMS_MEDIASTATE_LOADED
     * @type {Integer (Int32)}
     */
    static MEDIASTATE_LOADED => 3

    /**
     * Native name: NTMS_MEDIASTATE_UNLOADED
     * @type {Integer (Int32)}
     */
    static MEDIASTATE_UNLOADED => 4

    /**
     * Native name: NTMS_MEDIASTATE_OPERROR
     * @type {Integer (Int32)}
     */
    static MEDIASTATE_OPERROR => 5

    /**
     * Native name: NTMS_MEDIASTATE_OPREQ
     * @type {Integer (Int32)}
     */
    static MEDIASTATE_OPREQ => 6
}
