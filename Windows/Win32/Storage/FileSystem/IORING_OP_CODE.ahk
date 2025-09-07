#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of an I/O ring operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_op_code
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_OP_CODE{

    /**
     * No operation. This value is provided to enable testing queue management and overhead performance./
     * @type {Integer (Int32)}
     */
    static IORING_OP_NOP => 0

    /**
     * Read from a file to a buffer.
     * @type {Integer (Int32)}
     */
    static IORING_OP_READ => 1

    /**
     * Register an array of file handles with the I/O ring.
 * 
 * If any existing registration exists, it is completely replaced by the registration for this opcode. Any entries in the array with INVALID_HANDLE_VALUE are sparse entries and are not used, which can be used to release one or more of the previously registered files. 
 * 
 * Unregistration of all current files is accomplished by providing a zero length array. The input array must remain valid until the operation completes. The change impacts all entries in the queue after this completes. I.e. This implicitly has "link" semantics in that any subsequent entry will not start until after this is completed.
     * @type {Integer (Int32)}
     */
    static IORING_OP_REGISTER_FILES => 2

    /**
     * Register an array of [IORING_BUFFER_INFO](ns-ntioring_x-ioring_buffer_info.md) with the IORING.
 * 
 * If any existing registration exists, it is completely replaced by the registration for this opcode. Any entries in the array with INVALID_HANDLE_VALUE are sparse entries and are not used, which can be used to release one or more of the previously registered files. 
 * 
 * Unregistration of all current files is accomplished by providing a zero length array. The input array must remain valid until the operation completes. The change impacts all entries in the queue after this completes. I.e. This implicitly has "link" semantics in that any subsequent entry will not start until after this is completed.
     * @type {Integer (Int32)}
     */
    static IORING_OP_REGISTER_BUFFERS => 3

    /**
     * Request cancellation of a previously submitted operation. The *UserData* passed in when the operation was initiated is used to identify the operation to be cancelled. The cancellation operation completes after the canceled operation completes unless there is an error attempting the cancellation. For example, if no operation is found with the specified *UserData*.
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
}
