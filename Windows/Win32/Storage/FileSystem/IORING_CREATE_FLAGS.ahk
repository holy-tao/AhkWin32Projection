#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies flags for creating an I/O ring with a call to CreateIoRing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_create_flags
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_CREATE_FLAGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A bitwise OR combination of flags from the [IORING_CREATE_REQUIRED_FLAGS](ne-ioringapi-ioring_create_required_flags.md) enumeration. If any unknown required flags are provided to an API, the API will fail the associated call.
     * @type {Integer}
     */
    Required {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A bitwise OR combination of flags from the [IORING_CREATE_ADVISORY_FLAGS](ne-ioringapi-ioring_create_advisory_flags.md) enumeration.Advisory flags. Any unknown or unsupported advisory flags provided to an API are ignored.
     * @type {Integer}
     */
    Advisory {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
