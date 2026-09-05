#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class REFS_SMR_VOLUME_GC_ACTION extends Win32Enum {

    /**
     * Native name: SmrGcActionStart
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * Native name: SmrGcActionStartFullSpeed
     * @type {Integer (Int32)}
     */
    static StartFullSpeed => 2

    /**
     * Native name: SmrGcActionPause
     * @type {Integer (Int32)}
     */
    static Pause => 3

    /**
     * Native name: SmrGcActionStop
     * @type {Integer (Int32)}
     */
    static Stop => 4
}
