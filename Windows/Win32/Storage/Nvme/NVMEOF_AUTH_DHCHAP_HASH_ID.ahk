#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_AUTH_DHCHAP_HASH_ID{

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPHashReserved => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPHashSha256 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPHashSha384 => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPHashSha512 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPHashMax => 255
}
