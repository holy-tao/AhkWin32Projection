#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FS_BPIO_OPERATIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FS_BPIO_OP_ENABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FS_BPIO_OP_DISABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static FS_BPIO_OP_QUERY => 3

    /**
     * @type {Integer (Int32)}
     */
    static FS_BPIO_OP_VOLUME_STACK_PAUSE => 4

    /**
     * @type {Integer (Int32)}
     */
    static FS_BPIO_OP_VOLUME_STACK_RESUME => 5

    /**
     * @type {Integer (Int32)}
     */
    static FS_BPIO_OP_STREAM_PAUSE => 6

    /**
     * @type {Integer (Int32)}
     */
    static FS_BPIO_OP_STREAM_RESUME => 7

    /**
     * @type {Integer (Int32)}
     */
    static FS_BPIO_OP_GET_INFO => 8

    /**
     * @type {Integer (Int32)}
     */
    static FS_BPIO_OP_MAX_OPERATION => 9
}
