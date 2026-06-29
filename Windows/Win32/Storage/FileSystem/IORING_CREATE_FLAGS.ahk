#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IORING_CREATE_ADVISORY_FLAGS.ahk" { IORING_CREATE_ADVISORY_FLAGS }
#Import ".\IORING_CREATE_REQUIRED_FLAGS.ahk" { IORING_CREATE_REQUIRED_FLAGS }

/**
 * Specifies flags for creating an I/O ring with a call to CreateIoRing.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_create_flags
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_CREATE_FLAGS {
    #StructPack 4

    /**
     * A bitwise OR combination of flags from the [IORING_CREATE_REQUIRED_FLAGS](ne-ioringapi-ioring_create_required_flags.md) enumeration. If any unknown required flags are provided to an API, the API will fail the associated call.
     */
    Required : IORING_CREATE_REQUIRED_FLAGS

    /**
     * A bitwise OR combination of flags from the [IORING_CREATE_ADVISORY_FLAGS](ne-ioringapi-ioring_create_advisory_flags.md) enumeration.Advisory flags. Any unknown or unsupported advisory flags provided to an API are ignored.
     */
    Advisory : IORING_CREATE_ADVISORY_FLAGS

}
