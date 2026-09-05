#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SHRINK_VOLUME_REQUEST_TYPES extends Win32Enum {

    /**
     * Native name: ShrinkPrepare
     * @type {Integer (Int32)}
     */
    static Prepare => 1

    /**
     * Native name: ShrinkCommit
     * @type {Integer (Int32)}
     */
    static Commit => 2

    /**
     * Native name: ShrinkAbort
     * @type {Integer (Int32)}
     */
    static Abort => 3
}
