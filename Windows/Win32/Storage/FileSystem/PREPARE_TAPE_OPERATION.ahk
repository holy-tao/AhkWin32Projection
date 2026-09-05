#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class PREPARE_TAPE_OPERATION extends Win32Enum {

    /**
     * Native name: TAPE_FORMAT
     * @type {Integer (UInt32)}
     */
    static FORMAT => 5

    /**
     * Native name: TAPE_LOAD
     * @type {Integer (UInt32)}
     */
    static LOAD => 0

    /**
     * Native name: TAPE_LOCK
     * @type {Integer (UInt32)}
     */
    static LOCK => 3

    /**
     * Native name: TAPE_TENSION
     * @type {Integer (UInt32)}
     */
    static TENSION => 2

    /**
     * Native name: TAPE_UNLOAD
     * @type {Integer (UInt32)}
     */
    static UNLOAD => 1

    /**
     * Native name: TAPE_UNLOCK
     * @type {Integer (UInt32)}
     */
    static UNLOCK => 4
}
