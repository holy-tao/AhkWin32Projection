#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_CONTEXT_CONSTANTS enumerated type specifies the maximum string lengths supported by members of the MBN_CONTEXT structure.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_context_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_CONTEXT_CONSTANTS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Maximum string length of the <b>accessString</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_context">MBN_CONTEXT</a> structure.
     * @type {Integer (Int32)}
     */
    static MBN_ACCESSSTRING_LEN => 100

    /**
     * Maximum string length of the <b>userName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_context">MBN_CONTEXT</a> structure.
     * @type {Integer (Int32)}
     */
    static MBN_USERNAME_LEN => 255

    /**
     * Maximum string length of the <b>password</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_context">MBN_CONTEXT</a> structure.
     * @type {Integer (Int32)}
     */
    static MBN_PASSWORD_LEN => 255

    /**
     * The device will find the appropriate index to store a context into.
     * @type {Integer (Int32)}
     */
    static MBN_CONTEXT_ID_APPEND => -1
}
