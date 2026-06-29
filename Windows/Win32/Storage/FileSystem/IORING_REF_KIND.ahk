#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of an IORING_HANDLE_REF structure.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_ref_kind
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_REF_KIND {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The referenced buffer is raw.
     * @type {Integer (Int32)}
     */
    static IORING_REF_RAW => 0

    /**
     * The referenced buffer has been registered with an I/O ring with a call to [BuildIoRingRegisterFileHandles](nf-ioringapi-buildioringregisterfilehandles.md)
     * @type {Integer (Int32)}
     */
    static IORING_REF_REGISTERED => 1
}
