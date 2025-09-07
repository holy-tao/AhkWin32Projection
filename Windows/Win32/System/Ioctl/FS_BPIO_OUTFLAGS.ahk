#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FS_BPIO_OUTFLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_OUTFL_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_OUTFL_VOLUME_STACK_BYPASS_PAUSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_OUTFL_STREAM_BYPASS_PAUSED => 2

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_OUTFL_FILTER_ATTACH_BLOCKED => 4

    /**
     * @type {Integer (Int32)}
     */
    static FSBPIO_OUTFL_COMPATIBLE_STORAGE_DRIVER => 8
}
