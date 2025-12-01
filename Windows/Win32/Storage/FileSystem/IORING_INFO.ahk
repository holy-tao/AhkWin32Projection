#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IORING_CREATE_FLAGS.ahk

/**
 * Represents the shape and version information for the specified I/O ring.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A [IORING_VERSION](../ntioring_x/ne-ntioring_x-ioring_version.md) structure representing the API version of the associated I/O ring.
     * @type {Integer}
     */
    IoRingVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A [IORING_CREATE_FLAGS](ns-ioringapi-ioring_create_flags.md) structure containing the creation flags with which the associated I/O ring.
     * @type {IORING_CREATE_FLAGS}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := IORING_CREATE_FLAGS(8, this)
            return this.__Flags
        }
    }

    /**
     * The actual minimum submission queue size. The system may round up the value requested in the call to [CreateIoRing](nf-ioringapi-createioring.md) as needed to ensure the actual size is a power of 2.
     * @type {Integer}
     */
    SubmissionQueueSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The actual minimum size of the completion queue. The system will round up the value requested in the call to **CreateIoRing** to a power of two that is no less than two times the actual submission queue size to allow for submissions while some operations are still in progress.
     * @type {Integer}
     */
    CompletionQueueSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
