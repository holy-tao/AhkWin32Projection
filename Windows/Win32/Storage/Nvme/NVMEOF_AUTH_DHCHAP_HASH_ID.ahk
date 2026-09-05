#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_AUTH_DHCHAP_HASH_ID extends Win32Enum {

    /**
     * Native name: NvmeofAuthDHCHAPHashReserved
     * @type {Integer (Int32)}
     */
    static Reserved => 0

    /**
     * Native name: NvmeofAuthDHCHAPHashSha256
     * @type {Integer (Int32)}
     */
    static Sha256 => 1

    /**
     * Native name: NvmeofAuthDHCHAPHashSha384
     * @type {Integer (Int32)}
     */
    static Sha384 => 2

    /**
     * Native name: NvmeofAuthDHCHAPHashSha512
     * @type {Integer (Int32)}
     */
    static Sha512 => 3

    /**
     * Native name: NvmeofAuthDHCHAPHashMax
     * @type {Integer (Int32)}
     */
    static Max => 255
}
