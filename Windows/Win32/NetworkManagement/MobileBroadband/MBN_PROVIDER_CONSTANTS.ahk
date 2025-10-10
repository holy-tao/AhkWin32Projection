#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MBN_PROVIDER_CONSTANTS enumerated type contains values that define the buffer lengths of MBN_PROVIDER members.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_provider_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_PROVIDER_CONSTANTS{

    /**
     * The maximum length of the <b>providerName</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structure.
     * @type {Integer (Int32)}
     */
    static MBN_PROVIDERNAME_LEN => 20

    /**
     * The maximum length of the <b>providerID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structure.
     * @type {Integer (Int32)}
     */
    static MBN_PROVIDERID_LEN => 6
}
