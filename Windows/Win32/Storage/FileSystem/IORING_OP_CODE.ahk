#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of an I/O ring operation.
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_op_code
 * @namespace Windows.Win32.Storage.FileSystem
 */
class IORING_OP_CODE extends Win32Enum {

    /**
     * No operation. This value is provided to enable testing queue management and overhead performance./
     * Native name: IORING_OP_NOP
     * @type {Integer (Int32)}
     */
    static NOP => 0

    /**
     * Read from a file to a buffer.
     * Native name: IORING_OP_READ
     * @type {Integer (Int32)}
     */
    static READ => 1

    /**
     * Register an array of file handles with the I/O ring.
     * 
     * If any existing registration exists, it is completely replaced by the registration for this opcode. Any entries in the array with INVALID_HANDLE_VALUE are sparse entries and are not used, which can be used to release one or more of the previously registered files. 
     * 
     * Unregistration of all current files is accomplished by providing a zero length array. The input array must remain valid until the operation completes. The change impacts all entries in the queue after this completes. I.e. This implicitly has "link" semantics in that any subsequent entry will not start until after this is completed.
     * Native name: IORING_OP_REGISTER_FILES
     * @type {Integer (Int32)}
     */
    static REGISTER_FILES => 2

    /**
     * Register an array of [IORING_BUFFER_INFO](ns-ntioring_x-ioring_buffer_info.md) with the IORING.
     * 
     * If any existing registration exists, it is completely replaced by the registration for this opcode. Any entries in the array with INVALID_HANDLE_VALUE are sparse entries and are not used, which can be used to release one or more of the previously registered files. 
     * 
     * Unregistration of all current files is accomplished by providing a zero length array. The input array must remain valid until the operation completes. The change impacts all entries in the queue after this completes. I.e. This implicitly has "link" semantics in that any subsequent entry will not start until after this is completed.
     * Native name: IORING_OP_REGISTER_BUFFERS
     * @type {Integer (Int32)}
     */
    static REGISTER_BUFFERS => 3

    /**
     * Request cancellation of a previously submitted operation. The *UserData* passed in when the operation was initiated is used to identify the operation to be cancelled. The cancellation operation completes after the canceled operation completes unless there is an error attempting the cancellation. For example, if no operation is found with the specified *UserData*.
     * Native name: IORING_OP_CANCEL
     * @type {Integer (Int32)}
     */
    static CANCEL => 4

    /**
     * Native name: IORING_OP_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 5

    /**
     * Native name: IORING_OP_FLUSH
     * @type {Integer (Int32)}
     */
    static FLUSH => 6

    /**
     * Native name: IORING_OP_READ_SCATTER
     * @type {Integer (Int32)}
     */
    static READ_SCATTER => 7

    /**
     * Native name: IORING_OP_WRITE_GATHER
     * @type {Integer (Int32)}
     */
    static WRITE_GATHER => 8
}
