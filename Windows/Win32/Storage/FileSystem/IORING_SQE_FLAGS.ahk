#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies kernel behavior options for I/O ring submission queue entries.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_sqe_flags
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_SQE_FLAGS {
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
    static IOSQE_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static IOSQE_FLAGS_DRAIN_PRECEDING_OPS => 1
}
