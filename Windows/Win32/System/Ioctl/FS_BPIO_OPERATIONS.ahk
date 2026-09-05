#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class FS_BPIO_OPERATIONS extends Win32Enum {

    /**
     * Native name: FS_BPIO_OP_ENABLE
     * @type {Integer (Int32)}
     */
    static OP_ENABLE => 1

    /**
     * Native name: FS_BPIO_OP_DISABLE
     * @type {Integer (Int32)}
     */
    static OP_DISABLE => 2

    /**
     * Native name: FS_BPIO_OP_QUERY
     * @type {Integer (Int32)}
     */
    static OP_QUERY => 3

    /**
     * Native name: FS_BPIO_OP_VOLUME_STACK_PAUSE
     * @type {Integer (Int32)}
     */
    static OP_VOLUME_STACK_PAUSE => 4

    /**
     * Native name: FS_BPIO_OP_VOLUME_STACK_RESUME
     * @type {Integer (Int32)}
     */
    static OP_VOLUME_STACK_RESUME => 5

    /**
     * Native name: FS_BPIO_OP_STREAM_PAUSE
     * @type {Integer (Int32)}
     */
    static OP_STREAM_PAUSE => 6

    /**
     * Native name: FS_BPIO_OP_STREAM_RESUME
     * @type {Integer (Int32)}
     */
    static OP_STREAM_RESUME => 7

    /**
     * Native name: FS_BPIO_OP_GET_INFO
     * @type {Integer (Int32)}
     */
    static OP_GET_INFO => 8

    /**
     * Native name: FS_BPIO_OP_MAX_OPERATION
     * @type {Integer (Int32)}
     */
    static OP_MAX_OPERATION => 9
}
