#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsEjectOperation extends Win32Enum {

    /**
     * Native name: NTMS_EJECT_START
     * @type {Integer (Int32)}
     */
    static START => 0

    /**
     * Native name: NTMS_EJECT_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 1

    /**
     * Native name: NTMS_EJECT_QUEUE
     * @type {Integer (Int32)}
     */
    static QUEUE => 2

    /**
     * Native name: NTMS_EJECT_FORCE
     * @type {Integer (Int32)}
     */
    static FORCE => 3

    /**
     * Native name: NTMS_EJECT_IMMEDIATE
     * @type {Integer (Int32)}
     */
    static IMMEDIATE => 4

    /**
     * Native name: NTMS_EJECT_ASK_USER
     * @type {Integer (Int32)}
     */
    static ASK_USER => 5
}
