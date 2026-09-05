#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class COPYPROGRESSROUTINE_PROGRESS extends Win32BitflagEnum {

    /**
     * Native name: PROGRESS_CONTINUE
     * @type {Integer (UInt32)}
     */
    static CONTINUE => 0

    /**
     * Native name: PROGRESS_CANCEL
     * @type {Integer (UInt32)}
     */
    static CANCEL => 1

    /**
     * Native name: PROGRESS_STOP
     * @type {Integer (UInt32)}
     */
    static STOP => 2

    /**
     * Native name: PROGRESS_QUIET
     * @type {Integer (UInt32)}
     */
    static QUIET => 3
}
