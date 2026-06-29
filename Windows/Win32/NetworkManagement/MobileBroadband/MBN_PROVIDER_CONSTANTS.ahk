#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_PROVIDER_CONSTANTS enumerated type contains values that define the buffer lengths of MBN_PROVIDER members.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_provider_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_PROVIDER_CONSTANTS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
