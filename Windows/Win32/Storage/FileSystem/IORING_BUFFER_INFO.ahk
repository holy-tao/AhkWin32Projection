#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a data buffer that can be registered with an I/O ring.
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ns-ntioring_x-ioring_buffer_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_BUFFER_INFO {
    #StructPack 8

    /**
     * A **VOID** pointer representing the address of the data buffer.
     */
    Address : IntPtr

    /**
     * The length of the data buffer, in bytes.
     */
    Length : UInt32

}
