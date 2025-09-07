#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies advisory flags for creating an I/O ring with a call to CreateIoRing.
 * @remarks
 * Use the [IORING_CREATE_FLAGS](ns-ioringapi-ioring_create_flags.md) structure to pass flags into **CreateIoRing**. Any unknown or unsupported advisory flags provided to an API are ignored.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_create_advisory_flags
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_CREATE_ADVISORY_FLAGS{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static IORING_CREATE_ADVISORY_FLAGS_NONE => 0
}
