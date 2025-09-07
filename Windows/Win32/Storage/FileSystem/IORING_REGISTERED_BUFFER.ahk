#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a buffer that has been registered with an I/O ring with a call to BuildIoRingRegisterBuffers.
 * @remarks
 * By using both a buffer index within the submission queue and an offset within the buffer, you can use large buffers and schedule multiple I/O ring operations within the same buffer to be performed asynchronously.
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ns-ntioring_x-ioring_registered_buffer
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_REGISTERED_BUFFER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A **UINT32** specifying the index of the registered buffer.
     * @type {Integer}
     */
    BufferIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A **UINT32** specifying the offset into the registered buffer.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
