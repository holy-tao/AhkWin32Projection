#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a buffer that has been registered with an I/O ring with a call to BuildIoRingRegisterBuffers.
 * @remarks
 * By using both a buffer index within the submission queue and an offset within the buffer, you can use large buffers and schedule multiple I/O ring operations within the same buffer to be performed asynchronously.
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ns-ntioring_x-ioring_registered_buffer
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_REGISTERED_BUFFER {
    #StructPack 4

    /**
     * A **UINT32** specifying the index of the registered buffer.
     */
    BufferIndex : UInt32

    /**
     * A **UINT32** specifying the offset into the registered buffer.
     */
    Offset : UInt32

}
