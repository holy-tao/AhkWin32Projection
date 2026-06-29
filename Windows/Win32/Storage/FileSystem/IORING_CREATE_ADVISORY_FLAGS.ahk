#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies advisory flags for creating an I/O ring with a call to CreateIoRing.
 * @remarks
 * Use the [IORING_CREATE_FLAGS](ns-ioringapi-ioring_create_flags.md) structure to pass flags into **CreateIoRing**. Any unknown or unsupported advisory flags provided to an API are ignored.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_create_advisory_flags
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_CREATE_ADVISORY_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static IORING_CREATE_ADVISORY_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static IORING_CREATE_SKIP_BUILDER_PARAM_CHECKS => 1
}
