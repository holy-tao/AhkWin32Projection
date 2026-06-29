#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FS_BPIO_OPERATIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
