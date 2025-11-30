#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class COPYPROGRESSROUTINE_PROGRESS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PROGRESS_CONTINUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROGRESS_CANCEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROGRESS_STOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROGRESS_QUIET => 3
}
