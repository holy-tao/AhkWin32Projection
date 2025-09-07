#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_CONTEXT_CONSTANTS enumerated type specifies the maximum string lengths supported by members of the MBN_CONTEXT structure.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_context_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_CONTEXT_CONSTANTS{

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
