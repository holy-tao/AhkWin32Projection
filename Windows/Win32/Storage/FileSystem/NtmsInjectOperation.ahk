#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsInjectOperation extends Win32Enum {

    /**
     * Native name: NTMS_INJECT_START
     * @type {Integer (Int32)}
     */
    static START => 0

    /**
     * Native name: NTMS_INJECT_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 1

    /**
     * Native name: NTMS_INJECT_RETRACT
     * @type {Integer (Int32)}
     */
    static RETRACT => 2

    /**
     * Native name: NTMS_INJECT_STARTMANY
     * @type {Integer (Int32)}
     */
    static STARTMANY => 3
}
