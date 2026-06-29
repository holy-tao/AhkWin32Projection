#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores IPsec traffic statistics. (IPSEC_TRAFFIC_STATISTICS0)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_traffic_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TRAFFIC_STATISTICS0 {
    #StructPack 8

    /**
     * Specifies encrypted byte count.
     */
    encryptedByteCount : Int64

    /**
     * Specifies authenticated AH byte count.
     */
    authenticatedAHByteCount : Int64

    /**
     * Specifies authenticated ESP byte count.
     */
    authenticatedESPByteCount : Int64

    /**
     * Specifies transport byte count.
     */
    transportByteCount : Int64

    /**
     * Specifies tunnel byte count.
     */
    tunnelByteCount : Int64

    /**
     * Specifies offload byte count.
     */
    offloadByteCount : Int64

}
