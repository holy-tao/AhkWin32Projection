#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IORING_CREATE_ADVISORY_FLAGS.ahk" { IORING_CREATE_ADVISORY_FLAGS }
#Import ".\IORING_CREATE_FLAGS.ahk" { IORING_CREATE_FLAGS }
#Import ".\IORING_CREATE_REQUIRED_FLAGS.ahk" { IORING_CREATE_REQUIRED_FLAGS }
#Import ".\IORING_VERSION.ahk" { IORING_VERSION }

/**
 * Represents the shape and version information for the specified I/O ring.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_INFO {
    #StructPack 4

    /**
     * A [IORING_VERSION](../ntioring_x/ne-ntioring_x-ioring_version.md) structure representing the API version of the associated I/O ring.
     */
    IoRingVersion : IORING_VERSION

    /**
     * A [IORING_CREATE_FLAGS](ns-ioringapi-ioring_create_flags.md) structure containing the creation flags with which the associated I/O ring.
     */
    Flags : IORING_CREATE_FLAGS

    /**
     * The actual minimum submission queue size. The system may round up the value requested in the call to [CreateIoRing](nf-ioringapi-createioring.md) as needed to ensure the actual size is a power of 2.
     */
    SubmissionQueueSize : UInt32

    /**
     * The actual minimum size of the completion queue. The system will round up the value requested in the call to **CreateIoRing** to a power of two that is no less than two times the actual submission queue size to allow for submissions while some operations are still in progress.
     */
    CompletionQueueSize : UInt32

}
