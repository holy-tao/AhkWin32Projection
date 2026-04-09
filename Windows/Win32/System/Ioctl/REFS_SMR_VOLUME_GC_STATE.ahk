#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class REFS_SMR_VOLUME_GC_STATE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcStateInactive => 0

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcStatePaused => 1

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcStateActive => 2

    /**
     * @type {Integer (Int32)}
     */
    static SmrGcStateActiveFullSpeed => 3
}
