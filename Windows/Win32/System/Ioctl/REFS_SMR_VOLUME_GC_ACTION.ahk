#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class REFS_SMR_VOLUME_GC_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcActionStart => 1

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcActionStartFullSpeed => 2

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcActionPause => 3

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcActionStop => 4
}
