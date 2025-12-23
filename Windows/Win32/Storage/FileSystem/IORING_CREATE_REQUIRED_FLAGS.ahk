#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies required flags for creating an I/O ring with a call to CreateIoRing.
 * @remarks
 * Use the [IORING_CREATE_FLAGS](ns-ioringapi-ioring_create_flags.md) structure to pass flags into **CreateIoRing**. If any unknown required flags are provided to an API, the API will fail the associated call.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_create_required_flags
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_CREATE_REQUIRED_FLAGS extends Win32BitflagEnum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static IORING_CREATE_REQUIRED_FLAGS_NONE => 0
}
