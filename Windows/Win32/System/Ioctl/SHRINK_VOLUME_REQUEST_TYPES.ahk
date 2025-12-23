#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SHRINK_VOLUME_REQUEST_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ShrinkPrepare => 1

    /**
     * @type {Integer (Int32)}
     */
    static ShrinkCommit => 2

    /**
     * @type {Integer (Int32)}
     */
    static ShrinkAbort => 3
}
