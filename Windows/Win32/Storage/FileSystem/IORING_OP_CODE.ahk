#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_OP_CODE{

    /**
     * @type {Integer (Int32)}
     */
    static IORING_OP_NOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static IORING_OP_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static IORING_OP_REGISTER_FILES => 2

    /**
     * @type {Integer (Int32)}
     */
    static IORING_OP_REGISTER_BUFFERS => 3

    /**
     * @type {Integer (Int32)}
     */
    static IORING_OP_CANCEL => 4

    /**
     * @type {Integer (Int32)}
     */
    static IORING_OP_WRITE => 5

    /**
     * @type {Integer (Int32)}
     */
    static IORING_OP_FLUSH => 6

    /**
     * @type {Integer (Int32)}
     */
    static IORING_OP_READ_SCATTER => 7

    /**
     * @type {Integer (Int32)}
     */
    static IORING_OP_WRITE_GATHER => 8
}
