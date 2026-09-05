#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class REFS_SMR_VOLUME_GC_STATE extends Win32Enum {

    /**
     * Native name: SmrGcStateInactive
     * @type {Integer (Int32)}
     */
    static Inactive => 0

    /**
     * Native name: SmrGcStatePaused
     * @type {Integer (Int32)}
     */
    static Paused => 1

    /**
     * Native name: SmrGcStateActive
     * @type {Integer (Int32)}
     */
    static Active => 2

    /**
     * Native name: SmrGcStateActiveFullSpeed
     * @type {Integer (Int32)}
     */
    static ActiveFullSpeed => 3
}
