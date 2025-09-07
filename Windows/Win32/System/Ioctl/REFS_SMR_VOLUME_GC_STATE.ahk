#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class REFS_SMR_VOLUME_GC_STATE{

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
